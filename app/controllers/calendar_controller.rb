class CalendarController < ApplicationController
  def index
      @current_bookings = Booking.all
      @current_user = User.find(session[:user_id])
  end
  
  def show
     @day = params[:day]
     @totalbookings = params[:booking]
  end
  
  def daily_bookings (all_bookings, date)
    @potential_bookings = all_bookings
    @current_date = date
    @matches = Array.new
    @potential_bookings.each do |booking|
      if booking.time_start.to_date == @current_date.to_date
        @matches.push(booking)
      end
    end
    return @matches
  end

  helper_method :daily_bookings
end
