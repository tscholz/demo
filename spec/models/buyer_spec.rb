require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    @buyer = FactoryGirl.build :buyer, credits: 10
  end

  it 'lowers the credit by purchase amout' do
    @buyer.buy_for 10

    expect(@buyer.credits).to be_zero
  end

  it "can't have negative balance" do
    @buyer.credits = -1

    expect(@buyer).to be_invalid
  end

end
