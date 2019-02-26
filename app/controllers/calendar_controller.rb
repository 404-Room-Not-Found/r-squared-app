class CalendarController < ApplicationController
  def index
      @current_bookings = Booking.where(:booker_id => session[:user_id])
      @current_user = User.find(session[:user_id])
  end
  
  def show
    redirect_to show_calendar_path
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
