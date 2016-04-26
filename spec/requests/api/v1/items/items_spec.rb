require "rails_helper"

RSpec.describe "GET /api/v1/items" do
  it "returns all items" do
    item1 = Item.create(name: "Item 1", description: "Description 1", image_url: "image_url: 1")
    item2 = Item.create(name: "Item 2", description: "Description 2", image_url: "image_url: 2")
    item3 = Item.create(name: "Item 3", description: "Description 3", image_url: "image_url: 3")

    get "api/v1/items"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.count).to eq 3
    expect(json[0]["name"]).to eq "Item 1"
    expect(json[0]["description"]).to eq "Description 1"
    expect(json[0]["image_url"]).to eq "image_url: 1"
  end
end


# When I send a GET request to /api/v1/items
# I receive a 200 JSON response containing all items
# And each item has a name, description, and image_url but not the created_at or updated_at
