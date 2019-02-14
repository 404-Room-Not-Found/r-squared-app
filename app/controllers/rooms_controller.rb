class RoomsController < ApplicationController
before_action :validate_access 

  def room_params
    # todo: fix
    params[:Room]='wtf'
    params.permit(:room_id, :roomtype, :building_name)
  end

  def show
    id = params[:id] # retrieve Room ID from URI route
    @room = Room.find(id) # look up Room by unique ID
    # will render app/views/Rooms/show.<extension> by default
  end

  def index
    @rooms = Room.all
  end

  def new
    #attr_accessor :building_name, :room_id, :roomtype, :description, :booked, :booker, :operate_start, :operate_end
    # def initialize(attributes = {})
    #   @building_name  = attributes[:building_name]
    #   @room_id = attributes[:room_id]
    #   @roomtype = attributes[:roomtype]
    #   @description = attributes[:description]
    #   @booked = attributes[:booked]
    #   @booker = attributes[:booker]
    #   @operate_start = attributes[:operate_start]
    #   @operate_end = attributes[:operate_end]
      
    # end
  end

  def create
    @room = Room.create!(building_name: params[:room][:building_name], 
    room_id: params[:Roomid], tech: params[:room][:tech],
    roomtype: params[:room][:roomtype], numpeople: params[:room][:numpeople],
    arrangement: params[:room][:arrangement], operate_start: params[:room][:operate_start],
    operate_end: params[:room][:operate_end], description: params[:room][:description])
    
    flash[:notice] = "#{@room.building_name} #{@room.room_id} was successfully created."
    redirect_to rooms_path
  end

  def edit
    @room = Room.find params[:id]
  end

  def update
    @room = Room.find params[:id]
    @room.update_attributes!(Room_params)
    flash[:notice] = "#{@room.name} was successfully updated."
    redirect_to room_path(@room)
  end

  def destroy

      @Booking = Booking.find(params[:id])
      @Booking.destroy
      @current_bookings = Booking.where(:booker_id => session[:user_id])
      flash[:notice] = "Reservation are influenced"
    
      @Room = Room.find(params[:id])
      @Room.destroy
      flash[:notice] = "No reservation are influenced"
  
    redirect_to delete_path
  end
  
private 
  def validate_access 
      unless logged_in?
        redirect_to root_path
      end 
  end

end
