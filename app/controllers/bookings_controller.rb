class BookingsController < ApplicationController
before_action :validate_access 
  def booking_params
    params.require(:booking).permit(:room_id,:booker_id,
    :time_start,:time_end, :building_name, :reason)
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
    book_status = false
    start_time = DateTime.new(booking_params["time_start(1i)"].to_i, booking_params["time_start(2i)"].to_i, booking_params["time_start(3i)"].to_i, booking_params["time_start(4i)"].to_i, booking_params["time_start(5i)"].to_i)
    end_time = DateTime.new(booking_params["time_end(1i)"].to_i, booking_params["time_end(2i)"].to_i, booking_params["time_end(3i)"].to_i, booking_params["time_end(4i)"].to_i, booking_params["time_end(5i)"].to_i)
    room = Booking.where(:room_id => booking_params[:room_id])
    if !room.nil?
      room.each do |row|
         if start_time.between?(row.time_start, row.time_end) || end_time.between?(row.time_start, row.time_end) || row.time_start.between?(start_time, end_time) || row.time_end.between?(start_time, end_time)
            flash[:notice] = "Time Overlap"
            book_status = false
            break
          else
              book_status = true
        end
      end
      if book_status == false
        redirect_to new_booking_path and return
      elsif book_status == true
        booking = Booking.create!(booking_params)
        flash[:notice] = "#{booking.id} was successfully created."
        redirect_to home_index_path and return
      end
    end
    if room.nil?
      booking = Booking.create!(booking_params)
      flash[:notice] = "#{booking.id} was successfully created."
      redirect_to home_index_path and return
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
