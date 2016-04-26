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
      expect(result[:products][0][:name]).to eq "Sennheiser - Camera-Mount Wireless Microphone System - Black"
      expect(result[:products][0][:salePrice]).to eq 629.95
      expect(result[:products][0][:sku]).to eq 9678429

      expect(result[:products][14][:name]).to eq "Sennheiser - CX 3.00 Earbud Headphones - Red"
      expect(result[:products][14][:salePrice]).to eq 50.99
      expect(result[:products][14][:sku]).to eq 9068022
    end
  end
end
