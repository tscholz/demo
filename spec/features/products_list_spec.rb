require 'rails_helper'

RSpec.feature 'Products list', type: :feature do
  background do
    login_as @user = FactoryGirl.create(:buyer)
    @product = FactoryGirl.create :product, title: 'Car', variants: [FactoryGirl.build(:variant, price: 9)]
  end

  scenario 'Visiting products path' do
    visit products_path

    expect(page).to have_css "##{dom_id @product}"
    expect(page).to have_content 'Car'
    expect(page).to have_content '9.0'
    expect(page).to have_link 'Buy', href: product_purchase_path(@product)
  end

  scenario 'Having products without active variants' do
    @product.variants.update_all is_active: false
    visit products_path

    expect(page).not_to have_css "##{dom_id @product}"

    @product.variants = []
    visit products_path

    expect(page).not_to have_css "##{dom_id @product}"
  end
end
