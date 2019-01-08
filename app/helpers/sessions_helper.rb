module SessionsHelper
  # Logs in the given user.
  def log_in(user)
      session[:user_id] = user.id
  end
  
  def log_out(user)
      session[:user_id] = nil
  end
    
     # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  
  def logged_in?
    !current_user.nil?
  end
  
  def current_bookings
    if Booking.where(:booker_id => session[:user_id])
      @bookings = Booking.where(:booker_id => session[:user_id])
    end
  end
end
