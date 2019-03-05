class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :email, :password, :usertype)
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
      @user_name = params[:user][:email]
      @user_email = params[:user][:email]
      @user_password = params[:user][:password]
      if @user_name == "" || @user_email == "" || @user_password == ""
        flash[:notice] = "Please make sure all fields are filled in."
        redirect_to user_path and return
      end

      if @user_password.length > 8 && @user_password.count("A-Z") > 0 && @user_password.count("a-z") > 0 && @user_password.count("0-9") > 0
        user_params[:usertype] = "Student"
        @user = User.create(user_params)
        if @user.valid?
          redirect_to root_path and return
        else
          @user.destroy
          flash[:notice] = "Invalid Email Addrress"
          redirect_to user_path and return
        end
      else 
        flash[:notice] = "Invalid Password: Password should be at least 8 characters long, contain at least one uppercase leter, one lowercase letter, and one number"
        redirect_to user_path and return
      end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.name} was successfully updated."
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "user '#{@user.name}' deleted."
    redirect_to users_path
  end
  
private 
  def validate_access 
      unless logged_in?
        redirect_to root_path
      end 
  end
end
