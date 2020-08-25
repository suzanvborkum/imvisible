class ProtestsController < ApplicationController
  def index
    @protests = Protest.all
  end

  def show
    @protest = Protest.find(params[:id])
  end

  def new
    @protest = Protest.new
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
    params.require(:protest).permit(:experienced, :date, :time, :description, :station)
  end
end