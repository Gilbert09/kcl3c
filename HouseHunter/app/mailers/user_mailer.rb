class UserMailer < ApplicationMailer
  def welcome_email(user)
    mail(to: user.email) do |format|
      format.html { render layout: 'mailer.html.erb' }
      format.text
    end
  end
end
