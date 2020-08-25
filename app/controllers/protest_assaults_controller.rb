class ProtestAssaultsController < ApplicationController
  def create
    @protest = Protest.find(params[:protest_id])
    @assault_categories = AssaultCategory.where(id: params[:protest_assault][:assault_category])
    @assault_categories.each do |assault_category|
      protest_assault = ProtestAssault.new
      protest_assault.protest = @protest
      protest_assault.assault_category = assault_category
      protest_assault.save
    end
    redirect_to protest_path(@protest)
  end
end
