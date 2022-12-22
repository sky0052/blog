class Admin::UsersController < ApplicationController

  skip_before_action :authorized, :only => [:new ,:create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        redirect_to login_path
        flash[:notice] = "User is Successfully Created"
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) 
      flash[:notice] = "User was successfully updated"
      redirect_to admin_users_path
    else
      flash[:alert] = "There was a problem updating this user"
      render :edit, status: :unprocessable_entity
    end
  end


  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :about, :email, :password)
  end
end
