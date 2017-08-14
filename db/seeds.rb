# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products_completes_list = [
    [ "Zestaw 1", "to jest zestaw nr 1, posluzy jeszcze dlugie lata", Product::CATEGORIES["Komplety"], 3.00, 2.3, 1200, 100, true],
    [ "Zestaw 2", "to jest zestaw nr 2, posluzy jeszcze troche lata", Product::CATEGORIES["Komplety"], 3.00, 2.3, 1200, 100, true],
    [ "Zestaw 3", "to jest zestaw nr 3, posluzy jeszcze chwile", Product::CATEGORIES["Komplety"], 3.00, 2.3, 1200, 100, true],
    [ "Zestaw 4", "to jest zestaw nr 4, posluzy jeszcze juz tylko troszke", Product::CATEGORIES["Komplety"], 3.00, 2.3, 1200, 100, true],
    [ "Zestaw 5", "to jest zestaw nr 5, posluzy jeszcze wiele pokolen", Product::CATEGORIES["Komplety"], 3.00, 2.3, 1200, 100, true]
]

products_wall_list = [
    [ "mebloscianka 1", "to bedzie piekna mebloscianka ktora uraczy wasze oko", Product::CATEGORIES["Mebloscianki"], 3.00, 2.3, 1200, 100, true],
    [ "mebloscianka 2", "to bedzie piekna mebloscianka ktora uraczy wasze oko", Product::CATEGORIES["Mebloscianki"], 3.00, 2.3, 1200, 100, true],
    [ "mebloscianka 3", "to bedzie piekna mebloscianka ktora uraczy wasze oko", Product::CATEGORIES["Mebloscianki"], 3.00, 2.3, 1200, 100, true]
]

products_beds_list = [
    [ "lozko 1", "najwygodniejsze loze na jakim przyjdzie wam spac", Product::CATEGORIES["Lozka"], 3.00, 2.3, 6.0, 1200, 100, true],
    [ "lozko 2", "dobra kanapa na imprezy i drzemki", Product::CATEGORIES["Lozka"], 3.00, 2.3, 5.3, 1200, 100, true],
    [ "lozko 3", "to lozko nie nadaje sie dla psa", Product::CATEGORIES["Lozka"], 3.00, 2.3, 5.8, 1200, 100, true],
    [ "lozko 4", "lozko lubiane przez koty", Product::CATEGORIES["Lozka"], 3.00, 2.3, 5.8, 1200, 100, true]
]

products_completes_list.each_with_index do |product, id|
  Product.create( name: product[0], description: product[1], category: product[2], width: product[3], height: product[4],
  price_in_int: product[5], shipment_price_in_int: product[6], only_on_demand: product[7],
                  product_image: File.new("#{Rails.root}/app/assets/images/seed/zestawy/#{id}.jpg"))
end
puts "Skonczono dodawac zestawy"

products_wall_list.each_with_index do |product, id|
  Product.create( name: product[0], description: product[1], category: product[2], width: product[3], height: product[4],
                  price_in_int: product[5], shipment_price_in_int: product[6], only_on_demand: product[7],
                  product_image: File.new("#{Rails.root}/app/assets/images/seed/mebloscianki/#{id}.jpg"))
end
puts "skonczono dodawac mebloscianki"

products_beds_list.each_with_index do |product, id|
  Product.create( name: product[0], description: product[1], category: product[2], width: product[3], height: product[4],
                  sleeping_area: product[5], price_in_int: product[6], shipment_price_in_int: product[7],
                  only_on_demand: product[8], product_image: File.new("#{Rails.root}/app/assets/images/seed/lozka/#{id}.jpg"))
end
puts "skonczono dodawac lozka"

if Rails.env.development? and User.where(email: 'admin@example.com').blank?
  User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end