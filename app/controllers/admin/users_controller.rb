class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])    
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
