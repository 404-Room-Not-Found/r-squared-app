class SessionsController < ApplicationController

  def new
  end

  def create
    puts "PASSWORD"
    puts params[:session][:password]
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id]= @user.id
      @current_user = @user
      if @current_user != nil
        redirect_to home_index_url
      end
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  

  def destroy
    reset_session 
    redirect_to root_url
  end

end
