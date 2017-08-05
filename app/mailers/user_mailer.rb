class UserMailer < ApplicationMailer::Base

  def welcome_email(user)
    @user = user
    @url ='http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to my awesome site')
  end
end

# if not using generator, make sure that it inherits from ActionMailer::Base
