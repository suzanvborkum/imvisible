class ProtestsController < ApplicationController
  def index
    if params[:search_station]
      @protests = Protest.where(station_id: params[:search_station])
    elsif params[:start_date]
      date = Date.new(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
      @protests = Protest.where(date: date)
    elsif params[:search_category]
      @protests = Protest.joins(:protest_assaults).where(protest_assaults: { assault_category_id: params[:search_category] })
    else
      @protests = Protest.all.order(date: :desc)
    end
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
      flash[:notice] = 'Successfully checked in'
      redirect_to protests_path
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
