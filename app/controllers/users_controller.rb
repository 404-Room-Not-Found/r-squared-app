class UsersController < ApplicationController

  def user_params
    params.require(:User).permit(:name, :email, :password, :usertype)
  end

  def show
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
    # will render app/views/users/show.<extension> by default
  end

  def index
    @users = User.all
  end

  def new
    attr_accessor :name, :email, :password, :usertype
    def initialize(attributes = {})
      @name  = attributes[:name]
      @email = attributes[:email]
      @password = attributes[:password]
      @usertype = attributes[:usertype]
    end
  end

  def create
    @user = User.create!(user_params)
    flash[:notice] = "#{@user.name} was successfully created."
    redirect_to users_path
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

end
