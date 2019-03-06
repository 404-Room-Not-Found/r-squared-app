class BookingsController < ApplicationController
before_action :validate_access 
  def booking_params
    params.require(:booking).permit(:room_id,:booker_id,
    :time_start,:time_end, :building_name, :reason, :privatereason, :booker_name)
  end 

  def show
    id = params[:id] # retrieve booking ID from URI route
    @booking = Booking.find(id) # look up booking by unique ID
    @user = User.where(:id => session[:user_id])
    # will render app/views/bookings/show.<extension> by default
  end

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @user = User.where(:id => session[:user_id])
  end

  def create
    @user =  User.find(session[:user_id])
    @book_status = false
    booking_params[:booker_name] = @user.name
    start_time = DateTime.new(booking_params["time_start(1i)"].to_i, booking_params["time_start(2i)"].to_i, booking_params["time_start(3i)"].to_i, booking_params["time_start(4i)"].to_i, booking_params["time_start(5i)"].to_i)
    end_time = DateTime.new(booking_params["time_end(1i)"].to_i, booking_params["time_end(2i)"].to_i, booking_params["time_end(3i)"].to_i, booking_params["time_end(4i)"].to_i, booking_params["time_end(5i)"].to_i)
    room = Booking.where(:room_id => booking_params[:room_id])
    room_open_hours = Room.find(booking_params[:room_id]).operate_start.strftime("%k:%M")
    room_close_hours = Room.find(booking_params[:room_id]).operate_end.strftime("%k:%M")
    booking_start_time = start_time.to_time.strftime("%k:%M")
    booking_end_time = end_time.to_time.strftime("%k:%M")
    hour_difference = ((end_time.to_time - start_time.to_time) / 1.hours).ceil.to_i
    if !room.nil?
      room.each do |row|
         if start_time.between?(row.time_start, row.time_end) || end_time.between?(row.time_start, row.time_end) || row.time_start.between?(start_time, end_time) || row.time_end.between?(start_time, end_time)
            flash[:notice] = "Booking has time conflict. Please adjust reservation time."
            @book_status = false
            break
          elsif start_time < DateTime.now || end_time < DateTime.now
            flash[:notice] = "Booking must be in future. Please adjust reservation time."
            @book_status = false
            break
          elsif end_time <= start_time
            flash[:notice] = "End time must be after start time. Please adjust reservation time."
            @book_status = false
            break
          elsif (!booking_start_time.between?(room_open_hours, room_close_hours) || !booking_end_time.between?(room_open_hours, room_close_hours)) && @user.usertype == "Student"
            flash[:notice] = "Room operating hours are between " + room_open_hours + " and " +room_close_hours + " daily. Please adjust reservation time."
            @book_status = false
            break
          elsif hour_difference > 11 && @user.usertype == "Student"
            flash[:notice] = "Room operating hours are between " + room_open_hours + " and " +room_close_hours + " daily. Please adjust reservation time."
            @book_status = false
            break
          else
              @book_status = true
        end
      end
      if @book_status == false
        redirect_to new_booking_path and return
      elsif @book_status == true
        @booking = Booking.create!(booking_params)
        flash[:notice] = "Booking was successfully created."
        redirect_to home_index_path and return
      end
    end
    if room.nil?
      @booking = Booking.create!(booking_params)
      flash[:notice] = "Booking was successfully created."
      redirect_to home_index_path and return
    end
  end

  def edit
    @booking = Booking.find params[:id]
  end

  def update
    @user =  User.find(session[:user_id])
    @book_status = false
    @total_conflicts = 0
    room = Booking.where(:room_id => booking_params[:room_id])
    start_time = DateTime.new(booking_params["time_start(1i)"].to_i, booking_params["time_start(2i)"].to_i, booking_params["time_start(3i)"].to_i, booking_params["time_start(4i)"].to_i, booking_params["time_start(5i)"].to_i)
    end_time = DateTime.new(booking_params["time_end(1i)"].to_i, booking_params["time_end(2i)"].to_i, booking_params["time_end(3i)"].to_i, booking_params["time_end(4i)"].to_i, booking_params["time_end(5i)"].to_i)
    room_open_hours = Room.find(booking_params[:room_id]).operate_start.strftime("%k:%M")
    room_close_hours = Room.find(booking_params[:room_id]).operate_end.strftime("%k:%M")
    booking_start_time = start_time.to_time.strftime("%k:%M")
    booking_end_time = end_time.to_time.strftime("%k:%M")
    hour_difference = ((end_time.to_time - start_time.to_time) / 1.hours).ceil.to_i
    if !room.nil?
      room.each do |row|
         if start_time.between?(row.time_start, row.time_end) || end_time.between?(row.time_start, row.time_end) || row.time_start.between?(start_time, end_time) || row.time_end.between?(start_time, end_time)
            @total_conflicts += 1
         end
      end
      if @total_conflicts > 1
        flash[:notice] = "Booking has time conflict. Please adjust reservation time."
        redirect_to edit_booking_path and return
      elsif start_time < DateTime.now || end_time < DateTime.now
            flash[:notice] = "Booking must be in the future. Please adjust reservation time."
            redirect_to edit_booking_path and return
      elsif end_time <= start_time
            flash[:notice] = "End time must be after start time. Please adjust reservation time."
            redirect_to edit_booking_path and return
      elsif (!booking_start_time.between?(room_open_hours, room_close_hours) || !booking_end_time.between?(room_open_hours, room_close_hours)) && @user.usertype == "Student"
            flash[:notice] = "Room operating hours are between " + room_open_hours + " and " +room_close_hours + " daily. Please adjust reservation time."
            redirect_to edit_booking_path and return
      elsif hour_difference > 11 && @user.usertype == "Student"
            flash[:notice] = "Room operating hours are between " + room_open_hours + " and " +room_close_hours + " daily. Please adjust reservation time."
            redirect_to edit_booking_path and return
      else
        @booking = Booking.find params[:id]
        @booking = @booking.update_attributes(booking_params)
        flash[:notice] = "Booking was successfully updated."
        redirect_to home_index_path and return
      end
    end
    if room.nil?
      if end_time <= start_time
            flash[:notice] = "End time must be after start time. Please adjust reservation time."
            redirect_to edit_booking_path and return
      elsif start_time < DateTime.now || end_time < DateTime.now
            flash[:notice] = "Booking must be in the future. Please adjust reservation time."
            redirect_to edit_booking_path and return
      elsif (!booking_start_time.between?(room_open_hours, room_close_hours) || !booking_end_time.between?(room_open_hours, room_close_hours)) && @user.usertype == "Student"
            flash[:notice] = "Room operating hours are between " + room_open_hours + " and " +room_close_hours + " daily. Please adjust reservation time."
            redirect_to edit_booking_path and return
      elsif hour_difference > 11 && @user.usertype == "Student"
          flash[:notice] = "Room operating hours are between " + room_open_hours + " and " +room_close_hours + " daily. Please adjust reservation time."
          redirect_to edit_booking_path and return
      else
        @booking = Booking.find params[:id]
        @booking = @booking.update_attributes(booking_params)
        flash[:notice] = "Booking was successfully updated."
        redirect_to home_index_path and return
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "Booking successfully deleted."
    redirect_to home_index_path
  end
private 
  def validate_access 
      unless logged_in?
        redirect_to root_path
      end 
  end
end
