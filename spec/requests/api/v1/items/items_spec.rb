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

RSpec.describe "GET api/v1/items/1" do
  it "returns the item with id: 1" do
    item1 = Item.create(name: "Item 1", description: "Description 1", image_url: "image_url: 1")
    item2 = Item.create(name: "Item 2", description: "Description 2", image_url: "image_url: 2")
    item3 = Item.create(name: "Item 3", description: "Description 3", image_url: "image_url: 3")

    get "api/v1/items/1"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json["name"]).to eq "Item 1"
    expect(json["description"]).to eq "Description 1"
    expect(json["image_url"]).to eq "image_url: 1"
  end
end

RSpec.describe "DELETE /api/v1/items/1" do
  it "deletes item with id: 1" do

    item1 = Item.create(name: "Item 1", description: "Description 1", image_url: "image_url: 1")
    item2 = Item.create(name: "Item 2", description: "Description 2", image_url: "image_url: 2")
    item3 = Item.create(name: "Item 3", description: "Description 3", image_url: "image_url: 3")

    delete "api/v1/items/1"

    expect(response.status).to eq 204
    expect(Item.count).to eq 2
    expect(Item.find_by(id: 1)).to be_nil
  end
end

RSpec.describe "POST /api/v1/items" do
  it "creates an item" do
    # post "api/v1/items?name=chair&description=sturdy&image_url=http://robohash.org/19.png"


  end
end


# When I send a POST request to /api/v1/items with a
# name, description, and image_url
# I receive a 201 JSON response if the record is successfully created And
# I receive a JSON response containing the name, description, and image_url
# but not the created_at or updated_at
#
# Verify that your API works using Postman or curl
