json.extract! product, :id, :width, :height, :sleeping_area, :category_id, :price_in_int, :shipment_price_in_int, :in_magazine, :only_on_demand, :description, :name, :created_at, :updated_at
json.url product_url(product, format: :json)
