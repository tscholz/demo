require 'rails_helper'

RSpec.describe Variant, type: :model do

  it 'has to have a price' do
    variant = FactoryGirl.build :variant, price: nil, quantity: 10

    expect(variant).to be_invalid
  end

  it 'has to have a quantity' do
    variant = FactoryGirl.build :variant, quantity: nil, price: 9.99

    expect(variant).to be_invalid
  end
end
