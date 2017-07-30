class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.float :width
      t.float :height
      t.float :sleeping_area
      t.integer :category_id
      t.integer :price_in_int
      t.integer :shipment_price_in_int
      t.boolean :in_magazine
      t.boolean :only_on_demand
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
