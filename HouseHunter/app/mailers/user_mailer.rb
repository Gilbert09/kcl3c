class UserMailer < ApplicationMailer

=begin
this class defines the mailer for all of our users, all emails sent from the user mailer are sent to users of the website.
=end

  default from: 'no-reply@homehunter.com'

  # this method defines the email which is sent out when a user registers to create an account.
  def confirm_address(user)
    @user = user
    @url = 'http://homehunter.com/confirmationresponse'
    mail(to: @user.email, subject: 'Please confirm your email address')
  end

  # this method defines the email which is sent out when a user tries to change their password.
  def confirm_password(user)
    @user = user
    mail(to: @user.email, subject: 'Your password has been changed')
  end

  # this method defines the email which is sent out when a user has registered saying they forgot their password.
  def forgot_password(user)
    @user = user
    @url = 'http://homehunter.com/forgotpassword'
    mail(to: @user.email, subject: 'Did you forget your password?')
  end

  # this method defines the email which is sent out when a user has listed a property successfully.
  def upload_confirmation(user)
    @user = user
    @url = 'http://homehunter.com/account/active'
    mail(to: @user.email, subject: 'Your property has successfully been listed')
  end

  # this method defines the email which is sent out when a user has finished the registration process and welcomes them to the site.
  def welcome_email(user)
    @user = user
    @url  = 'http://homehunter.com/login'
    mail(to: @user.email, subject: 'Welcome to HomeHunter.com')
  end
end
