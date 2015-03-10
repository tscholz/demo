# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#

if Rails.env.development?
  Buyer.find_or_create_by!(email: 'b@example.com') do |b|
    b.name = 'Buyer'
    b.password = 'test_it'
    b.password_confirmation = 'test_it'
  end

  10.times do
    Product.create! do |p|
      p.title = Faker::Commerce.product_name
      p.description = Faker::Lorem.sentence 3
      p.variants.build price: Faker::Commerce.price, quantity: Faker::Number.digit
      p.variants.build price: Faker::Commerce.price, quantity: Faker::Number.digit
    end
  end
end
