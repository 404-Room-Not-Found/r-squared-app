class DailyreservationsController < ApplicationController
  before_action :validate_access
  def index
    puts "Here is the date we retrieved"
    puts params[:currentdate]
  end
  
  def show
  end
    
  private 
  def validate_access 
      unless logged_in?
        redirect_to root_path
      end 
  end
end
