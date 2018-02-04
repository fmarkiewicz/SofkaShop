class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.float :width
      t.float :height
      t.float :sleeping_area
      t.integer :price_in_int, null: false
      t.integer :category
      t.integer :shipment_price_in_int
      t.boolean :in_magazine
      t.boolean :only_on_demand
      t.text :description
      t.string :name, null: false, limit: 50

      t.timestamps
    end
  end
end
