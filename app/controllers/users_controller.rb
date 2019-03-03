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
      @user = User.create!(user_params)
      redirect_to root_path and return
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
