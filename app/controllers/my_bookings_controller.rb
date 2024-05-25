class MyBookingsController < ApplicationController
  def index
    @my_bookings = current_user.bookings
  end
end
