require "rails_helper"

RSpec.describe BestBuyService do
  it "returns products" do
    VCR.use_cassette("best_buy_service#index") do
      service = BestBuyService.new
      params = {
        sort: "name.asc",
        show: "name,customerReviewAverage,shortDescription,salePrice,image,sku",
        pageSize: "15",
        format: "json"
      }

      search_text = "sennheiser"
      result = service.products(search_text, params)

      expect(result[:products].count).to eq 15
      expect(result[:products][0][:name]).to eq "Galaxy Audio - Headset Microphone - Beige"
      expect(result[:products][0][:salePrice]).to eq 199.99
      expect(result[:products][0][:sku]).to eq 4763330

      expect(result[:products][14][:name]).to eq "Sennheiser - CH 800 S 10' Balanced Headphone Cable - Black"
      expect(result[:products][14][:salePrice]).to eq 379.99
      expect(result[:products][14][:sku]).to eq 6131445
    end
  end
end
