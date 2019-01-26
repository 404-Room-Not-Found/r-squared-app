class BookingsController < ApplicationController
before_action :validate_access 
  include Comparable
  attr :str
  def <=>(other)
    str.size <=> other.str.size
  end
  
  def booking_params
    params.require(:booking).permit(:room_id,:booker_id,
    :time_start,:time_end, :building_name)
  end

  def show
    id = params[:id] # retrieve booking ID from URI route
    @booking = Booking.find(id) # look up booking by unique ID
    # will render app/views/bookings/show.<extension> by default
  end

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    # @booking = Booking.create!(booking_params)
    # flash[:notice] = "#{@booking.id} was successfully created."
    # redirect_to home_index_path
    bookings = Booking.where(:room_id => booking_params[:room_id])
    bookings.each do |booking|
      if booking_params[:time_end].between?(3, 4) || booking_params[:time_start].between?(6, 7)
        flash[:error] = "Current Slot Time is already taken!"
        redirect_to bookings_path
        return
      else
        @booking = Booking.create!(booking_params)
        flash[:notice] = "#{@booking.id} was successfully created."
        redirect_to home_index_path
      end
    end
  end

  def edit
    @booking = Booking.find params[:id]
  end

  def update
    @booking = Booking.find params[:id]
    @booking.update_attributes!(booking_params)
    flash[:notice] = "#{@booking.id} was successfully updated."
    redirect_to home_index_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "Booking '#{@booking.id}' deleted."
    redirect_to home_index_path
  end
private 
  def validate_access 
      unless logged_in?
        redirect_to root_path
      end 
  end
end
