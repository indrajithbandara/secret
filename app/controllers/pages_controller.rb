class PagesController < ApplicationController

  before_action :authorize, only: [:answer]

  def index
  end

  def answer
  end
end
