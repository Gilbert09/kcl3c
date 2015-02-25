class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://homehunter.com/login'
    mail(to: @user.email,
         subject: 'Welcome to HomeHunter.com',
         template_path: 'notifications',
         template_name: 'another')
  end
end
