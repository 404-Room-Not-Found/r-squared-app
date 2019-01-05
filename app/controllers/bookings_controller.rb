class BookingsController < ApplicationController

  def booking_params
    params.require(:booking).permit(:room_id,:booker_id,:reason,
    :time_start,:time_end)
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
    # default: render 'new' template
  end

  def create
    @booking = Booking.create!(booking_params)
    flash[:notice] = "#{@booking.id} was successfully created."
    redirect_to bookings_path
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
