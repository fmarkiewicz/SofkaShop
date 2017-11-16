class Contact < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  # validates_presence_of :name, :email, :message
  # attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
        :subject => "Wiadomość z formularza kontaktowego Sofka",
        :to => ENV['MAILER_LOGIN'],
        :from => %("#{name}" <#{email}>)
    }
  end
end