class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
  	!!current_user
  end

  def authorize
  	if !logged_in?
  		flash[:danger] = "Please login !"
  		redirect_to login_path
  	end
  end

  def lockout
  	if logged_in?
			flash[:success] = "You are already logged in"
			redirect_to root_path
		end
  end

end
