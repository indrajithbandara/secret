class ProfilesController < ApplicationController
 	
 	before_action :authorize, only: [:show]

  def show
  end

end
