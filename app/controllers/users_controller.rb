class UsersController < ApplicationController
  
  def create
  	 @user = User.new(user_params)
    if @user.save
    	flash[:success] = "You can log in !"
      redirect_to root_path
    else
    	flash.now[:danger] = "Something went wrong try again"
      render 'new'
    end
  end

  def index
  	@users = User.all.order("created_at DESC")
  end

  def new
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
