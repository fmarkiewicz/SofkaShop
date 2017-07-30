class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.string :status
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :city
      t.string :country
      t.string :nip
      t.string :company
      t.string :email
      t.string :zip_code
      t.integer :total_price_in_int
      t.integer :total_shipment_price_in_int
      t.string :payment_type
      t.text :comment

      t.timestamps
    end
  end
end
