class PhotosController < ApplicationController

	def destroy
		@photo = Photo.find(params[:id])
		car = @photo.car

		@photo.destroy
		@photos = Photo.where(car_id: car.id)

		respond_to :js  #destroy method and this js call destory.js.erb file. this is a Rails convention.
	end
end