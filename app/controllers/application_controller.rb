class ApplicationController < ActionController::Base
	helper_method :logged_in?, :current_user
	before_action :authorized
	
	def current_user
		if session[:user_id]
			@user = User.find(session[:user_id])
		end
	end

	def logged_in?
		!!current_user
	end

	def authorized
		unless current_user
			flash[:notice] = "Please sign in to continue"
			redirect_to login_path
		end
	end



end
