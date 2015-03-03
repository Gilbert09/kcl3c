class StaticController < ApplicationController
  def index
	@email = current_user.email
    render 'index'
  end
end
