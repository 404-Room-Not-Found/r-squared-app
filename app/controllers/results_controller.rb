class ResultsController < ApplicationController

  def show
    id = params[:id] # retrieve Room ID from URI route
    @room = Room.find(id) # look up Room by unique ID
    # will render app/views/Rooms/show.<extension> by default
  end

  def index
    @rooms = Room.filter_from_params(filtering_params)
  end
  
  private
   #A list of the param names that can be used for filtering the Product list
  def filtering_params
    params[:room].slice(:building_name, :roomtype, :numpeople, :arrangement,
    :tech)
end
  
  
  
  # def index
  #   @rooms = Room.all
  #   params.each do |param|
  #     @rooms = @rooms.where(:building_name => param)
  #   end
  #   # @rooms = Room.filter_from_params(params.slice(:building_name, :roomtype, :numpeople, :arrangement,
  #   # :tech))
  # end
 
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
