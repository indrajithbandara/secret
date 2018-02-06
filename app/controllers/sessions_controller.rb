class SessionsController < ApplicationController

before_action :authorize, only: [:destroy]
before_action :lockout, only: [:create]


  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome to rails secret"
      redirect_to root_path
    else
      flash[:danger] = "Your email or password doesn't match"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You logged out come back soon !"
    redirect_to root_path
  end
end


