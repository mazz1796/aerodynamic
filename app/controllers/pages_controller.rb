class PagesController < ApplicationController
  def home
  	@cars = Car.all
  end

  def serch
  end
end
