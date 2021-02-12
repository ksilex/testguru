class ApplicationMailer < ActionMailer::Base
  default from: 'testgurumailerheroku@gmail.com', to: "negative074@gmail.com"
  layout 'mailer'
end
