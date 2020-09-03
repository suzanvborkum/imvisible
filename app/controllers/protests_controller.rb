class ProtestsController < ApplicationController
  def index

    if params[:search_category] || params[:search_station] || params[:start_date]
      @protests = query_protests(params[:search_category], params[:search_station], params[:start_date])
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

  def today
    @protests = Protest.all
    @count_protests = Protest.where(date: Date.today).count
    @count_locations = Protest.group(:station).where(date: Date.today).count.count
    @count_shares = rand(6..14)
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

  def query_protests(category_param, station_param, date_param)
    protests = []

    if category_param.present?
      protests = Protest.joins(:protest_assaults).where(protest_assaults: { assault_category_id: category_param })
    end

    if !station_param.empty?
      if not protests.empty?
        protests = protests.where(station_id: station_param)
      else
        protests = Protest.where(station_id: station_param)
      end
    end

    if date_param
      if !date_param.empty?
        date = Date.parse(date_param)
        if !protests.empty?
          protests = protests.where(date: date)
        else
          protests = Protest.where(date: date)
        end
      end
    end

    return protests
  end

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
