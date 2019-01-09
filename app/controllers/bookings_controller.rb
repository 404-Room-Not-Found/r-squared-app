class BookingsController < ApplicationController

  def booking_params
    params.require(:booking).permit(:building_name, :room_id,:booker_id,:reason,
    :time_start,:time_end, :room_name, :booker_name)
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
    # @booking = Booking.new
    # attr_accessor :room_id, :booker_id, :reason, :time_start, :time_end
    # def initialize(attributes = {})
    #   @building_name = attributes[:building_name]
    #   @room_id  = attributes[:room_id]
    #   @booker_id = attributes[:booker_id]
    #   @reason = attributes[:reason]
    #   @time_start = attributes[:time_start]
    #   @time_end = attributes[:time_end]
    # end
  end

  def create
    # @building_name = params[:building_name]
    # @room_id  = params[:room_name]
    # @booker_id = params[:booker_id]
    # @reason = params[:reason]
    # @time_start = params[:time_start]
    # @time_end = params[:time_end]
    
    
    
    @booking = Booking.create!(booking_params)
    flash[:notice] = "#{@booking.id} was successfully created."
    redirect_to home_index_path
  end

  def edit
    @booking = Booking.find params[:id]
  end

  def update
    @booking = Booking.find params[:id]
    @booking.update_attributes!(booking_params)
    flash[:notice] = "#{@booking.id} was successfully updated."
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "Booking '#{@booking.id}' deleted."
    redirect_to bookings_path
  end

end
