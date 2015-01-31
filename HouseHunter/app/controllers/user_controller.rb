class UserController < ApplicationController
  def show
    @users = User.find(params[:id])
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
