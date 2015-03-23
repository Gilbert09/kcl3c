class UsersController < Clearance::UsersController

=begin
this class represents the controller for all users, users must be signed in for the functionality of this class.
=end

  before_filter :redirect_signed_in_users, only: [:create, :new]
  skip_before_filter :require_login, only: [:create, :new]
  skip_before_filter :authorize, only: [:create, :new]

  # this method is called when a user creates a new user account on the website, it sends an email to the user asking them to confirm their account creation.
  def new
    @user = user_from_params
    render template: "users/new"

    UserMailer.confirm_address(@user).deliver_now
  end

  # this method is called when a user has confirmed the creation of their account by clicking on the link in the email,
  # it then saves the users details in the database and sends them an email letting them know they have finished their
  # account creation.
  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      UserMailer.welcome_email(@user).deliver_now
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end


  # all the methods below this line are private.
  private

  # this method is called when a user signs in.
  def avoid_sign_in
    warn "[DEPRECATION] Clearance's `avoid_sign_in` before_filter is " +
      "deprecated. Use `redirect_signed_in_users` instead. " +
      "Be sure to update any instances of `skip_before_filter :avoid_sign_in`" +
      " or `skip_before_action :avoid_sign_in` as well"
    redirect_signed_in_users
  end

  # this method is called when a user has signed in, it redirects them to the non static version of the web pages.
  def redirect_signed_in_users
    if signed_in?
      redirect_to Clearance.configuration.redirect_url
    end
  end

  # this method is again used in the security of the website and is used to create a new URL.
  def url_after_create
    Clearance.configuration.redirect_url
  end

  # this method deletes a user from the user model.
  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
    end
  end

  # this method creates a hash of all the currently signed in users.
  def user_params
    params[:user] || Hash.new
  end


end
