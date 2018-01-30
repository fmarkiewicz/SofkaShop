class Order < ApplicationRecord
  # has_and_belongs_to_many :products
  validates_presence_of :first_name, :last_name, :phone, :address, :city,
                        :zip_code, :email, :payment_type
  belongs_to :product
  after_save :send_email_about_status

  def send_email_about_status
    if status == 'closed'
      OrderMailer.closed_order_email(self).deliver_now
    else
      OrderMailer.change_order_status_email(self).deliver_now
    end
  end

end
