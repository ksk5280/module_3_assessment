require "rails_helper"

RSpec.describe "GET /api/v1/items" do
  it "returns all items" do
    create_items
    item1 = 
    json = JSON.parse(response.body)
    expect(response).to be_success
  end
end


# When I send a GET request to /api/v1/items
# I receive a 200 JSON response containing all items
# And each item has a name, description, and image_url but not the created_at or updated_at
