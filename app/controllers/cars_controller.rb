class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @cars = current_user.cars
  end

  def show
    @photos = @car.photos


    @booked = Reservation.where("car_id = ? AND user_id = ?", @car.id, current_user.id).present? if current_user

    @reviews = @car.reviews
    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
    
  end

  def new
    @car = Car.new
  end

  def create
    @car = current_user.cars.build(car_params)

    if @car.save

        if params[:images]
          params[:images].each do |image|
            @car.photos.create(image: image)
          end
        end

        @photos = @car.photos
        redirect_to edit_car_path(@car), notice: "Saved...."
    else
      render :new
    end
  end

  def edit
    if current_user.id == @car.user.id
      @photos = @car.photos
    else
      redirect_to root_path, notice:"You don't have permission."
    end
  end

  def update
    if @car.update(car_params)
      if params[:images]
          params[:images].each do |image|
            @car.photos.create(image: image)
        end
      end
      @photos = @car.photos
      redirect_to edit_car_path(@car), notice: "Updated...."
    else
      render :edit
    end
  end

  private

    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:body_type, :brand, :accommodate, :transmission, :drive_type, :listing_name, :summary, :address, :is_satnav, :is_bluetooth, :is_air, :is_usb, :is_abs, :price, :active)
    end

end



