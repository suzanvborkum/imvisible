class PagesController < ApplicationController
  def home
    @protests = Protest.all
    @count_protests = Protest.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count
    @count_locations = Protest.group(:station).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count.count
    @count_shares = rand(6..14)
  end

  def about
  end
end
