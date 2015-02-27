class UserMailer < ApplicationMailer
  default from: 'notifications@homehunter.com'

  def confirm_address(user)
    @user = user
    @url = 'http://homehunter.com/confirm_address'
    mail(to: @user.email, subject: 'Please confirm your email address')
  end

  def welcome_email(user)
    @user = user
    @url  = 'http://homehunter.com/login'
    mail(to: @user.email, subject: 'Welcome to HomeHunter.com')
  end
end
