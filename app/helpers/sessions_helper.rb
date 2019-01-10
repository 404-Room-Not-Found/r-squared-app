module SessionsHelper
  # Logs in the given user.
  @room = nil
  def log_in(user)
      session[:user_id] = user.id
  end
  
  def log_out
      session.delete(:user_id)
      @current_user = nil
  end
    
  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  def current_user_name
    if @current_user != nil
      @current_user.name
    end
  end
  
  def current_room_id
    params[:room_id]
  end
  
  def current_room_building
    params[:building_name]
  end
  
  def book_room_options
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def current_bookings
    if Booking.find_by(:booker_id => session[:user_id]) != nil
      @bookings = Booking.find_by(:booker_id => session[:user_id])
    end
  end
end
