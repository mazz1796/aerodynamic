class PagesController < ApplicationController
  def home
  	@cars = Car.all
  end

  def search
  	
  	if params[:search].present? && params[:search].strip != ""
  		session[:loc_search] = params[:search]
  	end

  	arrResult = Array.new

  	if session[:loc_search] && session[:loc_search] != ""
  		@cars_address = Car.where(active: true).near(session[:loc_search], 5, order: 'distance')
  	else
  		@cars_address = Car.where(active: true).all
  	end

  	@search = @cars_address.ransack(params[:q])
  	@cars = @search.result

  	@arrCars = @cars.to_a

  	if (params[:start_date] && params[:end_date] && !params[:start_date].empty? & !params[:end_date].empty?)

  		start_date = Date.parse(params[:start_date])
  		end_date = Date.parse(params[:end_date])

  		@cars.each do |car|

  			not_available = car.reservations.where(
  					"(? <= start_date AND start_date <= ?)
  					OR (? <= end_date AND end_date <= ?) 
  					OR (start_date < ? AND ? < end_date)",
  					start_date, end_date,
  					start_date, end_date,
  					start_date, end_date
  				).limit(1)

  			if not_available.length > 0
  				@arrCars.delete(car)	
  			end	

  		end

  	end

  end 
end
