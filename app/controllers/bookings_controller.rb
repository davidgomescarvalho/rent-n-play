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
    @instrument = Instrument.find(params[:instrument_id])
    @booking.instrument = @instrument
    @booking.user = current_user
    @booking.total_price = @instrument.price * (@booking.end_date - @booking.start_date).to_i
    @booking.status = "Pending"

    if @booking.save!
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'

    else
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: 'Booking was successfully updated.'
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
