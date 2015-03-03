class StaticController < ApplicationController
  before_action :authenticate_user!

  def index
	@email = current_user.email
    render 'index'
  end
end
