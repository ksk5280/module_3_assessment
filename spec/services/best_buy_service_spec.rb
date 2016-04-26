require "rails_helper"

RSpec.describe BestBuyService do
  it "returns products" do
    VCR.use_cassette("best_buy_service#index") do
      service = BestBuyService.new
      params = {
        sort: "name.asc",
        show: "name,customerReviewAverage,shortDescription,salePrice,image,sku&",
        facet: "name",
        pageSize: "15",
        callback: "JSON_CALLBACK",
        format: "json"
      }

      result = service.products("sennheiser", params)
    end
  end
end
