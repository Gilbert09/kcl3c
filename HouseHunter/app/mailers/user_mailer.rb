class UserMailer < ApplicationMailer
  default from: 'notifications@homehunter.com'

  def confirm_address(user)
    @user = user
    @url = 'http://homehunter.com/confirmation'
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

  def welcome_email(user)
    @user = user
    @url  = 'http://homehunter.com/login'
    mail(to: @user.email, subject: 'Welcome to HomeHunter.com')
  end
end
