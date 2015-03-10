class UsersController < Clearance::UsersController
  def new
    @user = User.new(params[:users])

    UserMailer.confirm_address(@user).deliver_now
  end

  def create
    @user = User.new(params[:users])

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_now

        format.html { redirect_to(@user, notice: 'User was sent the confirmation email.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
