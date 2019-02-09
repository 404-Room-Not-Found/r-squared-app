class CalendarBookingsController < ApplicationController
   def booking_params
        params.require(:booking).permit(:room_id,:booker_id,
        :time_start,:time_end, :building_name, :reason)
   end
   
   def index
       id = params[:id] # retrieve Room ID from URI route
       @booking = Booking.find(id) # look up Room by unique ID
   end
   
   def show
       
   end
   
   def new
   end
   
   def create
   end
   
   def edit
   end
   
   def update
   end
   
   def destroy
   end
   
   private 
  def validate_access 
      unless logged_in?
        redirect_to root_path
      end 
  end
end
