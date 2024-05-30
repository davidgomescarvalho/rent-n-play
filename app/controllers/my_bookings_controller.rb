class MyBookingsController < ApplicationController
  before_action :my_bookings, only: [:show, :destroy, :edit, :update]
  def index
    @my_bookings = current_user.bookings
  end

  def new
    @my_booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to my_bookings_path
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to my_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :number_of_people, :restaurant_id)
  end

  def my_bookings
    @my_bookings = current_user.bookings
  end

end
