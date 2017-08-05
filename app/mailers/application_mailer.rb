class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end

# allows you to send emails from app
# inherit from ActionMailer::Base
# have associated views in app/views

# rails command
# bin/rails generate mailer UserMailer
