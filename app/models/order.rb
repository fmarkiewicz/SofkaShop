class Order < ApplicationRecord
  # has_and_belongs_to_many :products
  validates_presence_of :first_name, :last_name, :phone, :address, :city,
                        :zip_code, :email, :payment_type
  after_save :send_email_about_status

  belongs_to :product
  # before_create :check_attributes

  #
  # def paypal_url(return_path, item)
  #
  #   values = { business: 'sofka.fake.dev@gmail.com',
  #              upload: 1,
  #              return: "#{Rails.application.secrets.app_host}#{return_path}",
  #              invoice: id,
  #              amount: 1,
  #              item_name: item.name,
  #              item_number: item.id,
  #              quantity: '1',
  #              notify_url: "#{Rails.application.secrets.app_host}/hook"
  #   }
  #   "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  # end

  def send_email_about_status
    if status == 'closed'
      OrderMailer.closed_order_email(self).deliver_now
    else
      OrderMailer.change_order_status_email(self).deliver_now
    end
  end
  #
  # def check_attributes
  #
  # end
end
