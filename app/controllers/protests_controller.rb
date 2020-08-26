class ProtestsController < ApplicationController
  def index
    @protests = Protest.all
    @stations = Station.all

    @markers = @stations.map do |station|
      {
        lat: station.latitude,
        lng: station.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { station: station }),
        number_of_protests: Protest.where(station_id: station).count
      }
    end
  end

  def show
    @protest = Protest.find(params[:id])
  end

  def new
    @protest = Protest.new
    @stations = Station.all
  end

  def create
    @protest = Protest.new(strong_params)
    if @protest.save
      redirect_to protest_path(@protest)
    else
      render :new
    end
  end

  private

  def build_geojson
    {
      type: "FeatureCollection",
      features: @protests.map(&:to_feature)
    }
  end

  def strong_params
    params.require(:protest).permit(:experienced, :date, :time, :description, :station_id, assault_category_ids: [])
  end
end
