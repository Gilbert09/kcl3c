class UserController < ApplicationController
  def create
    @user = User.new(params[:user])

    # Don't really know where to call this yet but putting it here cos it has to go out before we send the welcome email.
    UserMailer.confirm_address(@user).deliver_now

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_later

        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
