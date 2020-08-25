class ProtestsController < ApplicationController
  def index
    @protests = Protest.all
    @markers = @protests.map do |protest|
      {
        lat: protest.station.latitude
        lng: protest.station.longitude
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

  def strong_params
    params.require(:protest).permit(:experienced, :date, :time, :description, :station_id)
  end
end
