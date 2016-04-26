require "rails_helper"

RSpec.feature "User can search for products" do
  scenario "they see items" do
    # As a user
    # When I visit the "/"
    visit "/"
    # And I fill in the search box with "sennheiser" and click "search"
    fill_in "search", with: "sennheiser"
    click_on "search"

    # Then my current path should be "/search"
    expect(current_path).to eq "/search"

    # And I should see exactly 15 results
    # And each result should contain sku, name, customer average review, short description, sale price, and image ONLY
  end
end

#
# As a user
# When I visit the "/"
# And I fill in the search box with "sennheiser headphones white" and click "search"
# Then my current path should be "/search"
# And I should see limited results (at the time of writing, 3. SKUs: 9068155, 9068004, 9068128)
# And each result should contain sku, name, customer average review, short description, sale price, and image ONLY
