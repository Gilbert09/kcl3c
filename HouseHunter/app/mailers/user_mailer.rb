class UserMailer < ApplicationMailer
  default from: 'no-reply@homehunter.com'

  def confirm_address(user)
    @user = user
    @url = 'http://homehunter.com/confirmationresponse'
    mail(to: @user.email, subject: 'Please confirm your email address')
  end

  def confirm_password(user)
    @user = user
    mail(to: @user.email, subject: 'Your password has been changed')
  end

  def forgot_password(user)
    @user = user
    @url = 'http://homehunter.com/forgotpassword'
    mail(to: @user.email, subject: 'Did you forget your password?')
  end

  def upload_confirmation(user)
    @user = user
    @url = 'http://homehunter.com/activeListings'
    mail(to: @user.email, subject: 'Your property has successfully been listed')
  end

  def welcome_email(user)
    @user = user
    @url  = 'http://homehunter.com/login'
    mail(to: @user.email, subject: 'Welcome to HomeHunter.com')
  end
end
