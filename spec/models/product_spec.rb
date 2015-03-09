require 'rails_helper'

RSpec.describe Product, type: :model do

  it 'has to have a title' do
    product = FactoryGirl.build :product, title: ''

    expect(product).to be_invalid
  end

  it 'gets the price of the cheapest active variant' do
    most_expensive = FactoryGirl.build :variant, price: 10
    cheapest_active = FactoryGirl.build :variant, price: 1.0
    cheapest_inactive = FactoryGirl.build :variant, price: 0.5, is_active: false
    product = FactoryGirl.create :product, variants: [most_expensive, cheapest_active, cheapest_inactive]

    expect(product.price.to_s).to eql '1.0'
  end
end
