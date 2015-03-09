# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#

Buyer.find_or_create_by!(email: 'b@example.com') do |b|
  b.name = 'Buyer'
  b.password = 'test_it'
  b.password_confirmation = 'test_it'
end

Product.find_or_create_by!(title: 'Car') do |p|
  p.description = 'Nice Car'
  p.variants.build price: 10, quantity: 100
  p.variants.build price: 9, quantity: 20
end
