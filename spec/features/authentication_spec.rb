require 'rails_helper'

RSpec.feature "Authentication" do
  background do
    FactoryGirl.create :buyer, email: 'karl@example.org', password: 'ABCDEFGHIJ'
    @product = FactoryGirl.create :product_with_variants
  end

  scenario "Visit products without log in first" do
    visit products_path

    expect(page).to have_content 'Log in'

    fill_in 'Email', with: 'karl@example.org'
    fill_in 'Password', with: 'ABCDEFGHIJ'

    click_button 'Log in'

    expect(page).to have_css "##{dom_id @product}"
  end
end
