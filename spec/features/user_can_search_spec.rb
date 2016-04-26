require "rails_helper"

RSpec.feature "User can search for products" do
  scenario "they see items" do
    visit "/"
    fill_in "search", with: "sennheiser"
    click_on "search"

    expect(current_path).to eq "/search"

    expect(page).to have_content "15: Sennheiser - CX 3.00 Earbud Headphones - Red"
    expect(page).to have_content "1: Sennheiser - Camera-Mount Wireless Microphone System - Black"
    expect(page).to have_content "SKU: 9678429"
    expect(page).to have_content "Price: $629.95"
  end
end

#
# As a user
# When I visit the "/"
# And I fill in the search box with "sennheiser headphones white" and click "search"
# Then my current path should be "/search"
# And I should see limited results (at the time of writing, 3. SKUs: 9068155, 9068004, 9068128)
# And each result should contain sku, name, customer average review, short description, sale price, and image ONLY
