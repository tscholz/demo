require 'rails_helper'

RSpec.describe Coupon, type: :model do

  it 'has to have a code' do
    coupon = FactoryGirl.build :coupon
    coupon.code = nil

    expect(coupon).to be_invalid
  end

  it 'generates the code after initialize' do
    expect(Coupon.new.code).to be_present
  end
end
