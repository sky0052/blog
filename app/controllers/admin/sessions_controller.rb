class Admin::SessionsController < ApplicationController
  before_action :authorized, except: [:new, :create]
  before_action :if_user_already_logged_in, only: [:new]
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "You are login succesfully"
      redirect_to admin_user_path(@user)
    else
      flash[:alert] = "Your email or password is wrong please try again"
      redirect_to new_admin_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end


  def if_user_already_logged_in
    if current_user
      redirect_to admin_user_path(@user)
    end
  end


end
