class ResultsController < ApplicationController
  
  def show
    id = params[:id] # retrieve Room ID from URI route
    @room = Room.find(id) # look up Room by unique ID
    # will render app/views/Rooms/show.<extension> by default
  end

  def index
    @bookings = Booking.all
    @rooms = Room.filter_from_params(filtering_params)
    @rooms_time = filter_with_time(@rooms, @bookings)
  end
  
  private
   #A list of the param names that can be used for filtering the Product list
  def filtering_params
    params[:room].slice(:building_name, :roomtype, :numpeople, :arrangement, :tech)
  end
  
  def filter_with_time (rooms, bookings)
    @valid_rooms = Array.new
    @rooms = rooms
    @bookings = bookings
    @rooms.each do |room|
      @valid = true
      @bookings.each do |booking|
        if params[:room][:building_name] == ""
          if params[:booking][:starttime].to_s.between?(booking.time_start.to_s(:time), booking.time_end.to_s(:time)) || params[:booking][:endtime].to_s.between?(booking.time_start.to_s(:time), booking.time_end.to_s(:time))
            if params[:booking][:startdate].to_s.between?(Date.parse(booking.time_start.to_s).to_s, Date.parse(booking.time_end.to_s).to_s) || params[:booking][:enddate].to_s.between?(Date.parse(booking.time_start.to_s).to_s, Date.parse(booking.time_end.to_s).to_s)
              if room.room_id.to_s == Room.find(booking.room_id).room_id.to_s
                @valid = false
              end
            end
          end
        else
          if params[:booking][:starttime].to_s.between?(booking.time_start.to_s(:time), booking.time_end.to_s(:time)) || params[:booking][:endtime].to_s.between?(booking.time_start.to_s(:time), booking.time_end.to_s(:time))
            if params[:booking][:startdate].to_s.between?(Date.parse(booking.time_start.to_s).to_s, Date.parse(booking.time_end.to_s).to_s) || params[:booking][:enddate].to_s.between?(Date.parse(booking.time_start.to_s).to_s, Date.parse(booking.time_end.to_s).to_s)
              if params[:room][:building_name] == booking.building_name && room.room_id.to_s == Room.find(booking.room_id).room_id.to_s
              @valid = false
              end
            end
          end
        end
      end
      if @valid == true
        @valid_rooms.push(room)
      end
    end
    return @valid_rooms
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

end
