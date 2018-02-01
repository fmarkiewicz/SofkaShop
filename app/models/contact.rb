class Contact < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  # validates_presence_of :name, :email, :message

  def headers
    {
        :subject => "Wiadomość z formularza kontaktowego Sofka",
        :to => ENV['MAILER_LOGIN'],
        :from => %("#{name}" <#{email}>)
    }
  end
end
