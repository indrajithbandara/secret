class PagesController < ApplicationController

  before_action :authorize, only: [:answer]

  def index
  end

  def answer
  end

  private
   def authorize
  	if !logged_in?
  		flash[:danger] = "Please login !"
  		redirect_to root_path
  	end
  end
end
