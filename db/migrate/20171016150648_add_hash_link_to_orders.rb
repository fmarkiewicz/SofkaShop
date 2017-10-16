class AddHashLinkToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :hash_link, :string
  end
end
