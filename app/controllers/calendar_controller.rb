class CalendarController < ApplicationController
  def index
      @current_bookings = Booking.where(:booker_id => session[:user_id])
      @current_user = User.find(session[:user_id])
  end
end
