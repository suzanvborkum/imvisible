class PagesController < ApplicationController
  def home
    @protests = Protest.all
    @count_protests = Protest.where(date: Date.today).count
    @count_locations = Protest.group(:station).where(date: Date.today).count.count
    @count_shares = rand(6..14)
  end

  def about
  end
end
