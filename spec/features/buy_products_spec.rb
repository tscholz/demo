require 'rails_helper'

RSpec.feature "Buyer buys products" do
  background do
    @user = FactoryGirl.create :buyer, credits: 10
    @variant = FactoryGirl.build :variant, price: 9, quantity: 1
    @product = FactoryGirl.create :product, title: 'Car', variants: [@variant]
  end

  scenario 'Buy and have sufficiant credits' do
    login_as @user
    visit products_path

    expect {
      click_link 'Buy'
    }.to change { @variant.coupons.count }.by 1

    expect(@user.reload.credits.to_s).to eql '1.0'
    expect(@variant.reload.quantity).to eql 0
  end

  scenario 'Buy without having sufficient credits' do
    @user.update_column :credits, 1
    login_as @user

    visit products_path

    expect { click_link 'Buy' }.not_to change {@variant.reload.quantity}
    expect(@user.reload.credits.to_s).to eql '1.0'
    expect(page).to have_content "You don't have enouth cash to buy this!"
  end

  scenario 'Buy without beeing logged in' do
    # no login!

    visit products_path

    click_link 'Buy'

    expect(@user.reload.credits.to_s).to eql "10.0" # nothing changed
    expect(@variant.reload.quantity).to eql 1

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
