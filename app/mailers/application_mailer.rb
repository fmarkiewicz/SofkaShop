class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAILER_LOGIN']
  layout 'mailer'
end
