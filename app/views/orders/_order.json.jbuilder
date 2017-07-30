json.extract! order, :id, :order_number, :status, :first_name, :last_name, :phone, :address, :city, :country, :nip, :company, :email, :zip_code, :total_price_in_int, :total_shipment_price_in_int, :payment_type, :comment, :created_at, :updated_at
json.url order_url(order, format: :json)
