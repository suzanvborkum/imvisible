class PagesController < ApplicationController
  def home
    @homepage = "sticky-top overriding"
  end

  def about
  end
end
