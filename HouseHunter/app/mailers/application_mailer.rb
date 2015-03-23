class ApplicationMailer < ActionMailer::Base

=begin
this is the mailer class it defines the default address emails are sent from and their default layout.
=end

  default "no-reply@homehunter.com"
  layout 'mailer'
end
