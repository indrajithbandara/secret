class UsersController < ApplicationController
  
  before_action :authorize, only: [:edit, :update, :destroy]
  before_action :lockout, only: [:new, :create]

  def create
  	 @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
    	flash[:success] = "You are logged in !"
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

  def edit
   @user = User.find(params[:id])
   if @user.id != current_user.id 
    flash[:danger] = "Nice try pirate !"
    redirect_to root_path
   end
  end

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id && @user.update(user_params)
      flash[:success] = "You edited your profile !"
      redirect_to show_profile_path
    else
      flash.now[:danger] = "Something went wrong try again"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      session[:user_id] = nil
      @user.destroy
      flash[:success] = "You deleted your account !"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end

end
