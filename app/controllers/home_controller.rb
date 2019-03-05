class HomeController < ApplicationController
    def index
      @current_user = User.find(session[:user_id])
      @current_time = DateTime.now
      if @current_user[:usertype] == "Admin"
        @current_bookings = Booking.where("time_end  > ?", DateTime.now)
        @history_bookings = Booking.where("time_end  < ?", DateTime.now)
      else
        @current_bookings = Booking.where(:booker_id => session[:user_id]).where("time_end  > ?", DateTime.now)
        @history_bookings = Booking.where(:booker_id => session[:user_id]).where("time_end  < ?", DateTime.now)
      end
    end
    
    def params
      @params
    end
     
    before_action :validate_access 

private 
  def validate_access 
      unless logged_in?
        redirect_to root_path
      end 
  end
end
