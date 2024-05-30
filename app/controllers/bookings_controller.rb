class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new

    @booking = Booking.new
    @instrument = Instrument.find(params[:instrument_id])
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    puts booking_params.inspect
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      @instruments = Instrument.all
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :instrument_id)
  end
end
