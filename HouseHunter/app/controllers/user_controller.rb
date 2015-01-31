class UserController < ApplicationController
  def show
  end

  def new
  end

  def edit
  end

  #def delete end

  private
  def user_params
    params.require(:user).permit(:firstName, :lastName, :password, :title, :email)
  end
end
