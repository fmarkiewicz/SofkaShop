class Order < ApplicationRecord
  has_and_belongs_to_many :products
  validates_presence_of :first_name, :last_name, :phone, :address, :city,
                        :zip_code, :email, :payment_type

end
