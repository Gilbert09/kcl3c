class UsersController < ApplicationController
  def create
    @user = User.new(params[:users])

    respond_to do |format|
      if @user.save
        UserMailer.confirm_address(@user).deliver_now

        format.html { redirect_to(@user, notice: 'User was sent the confirmation email.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
