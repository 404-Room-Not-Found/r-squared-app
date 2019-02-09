class HomeController < ApplicationController
    def index
      @current_bookings = Booking.where(:booker_id => session[:user_id])
      @current_user = User.find(session[:user_id])
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
