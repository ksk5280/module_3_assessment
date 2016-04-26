require "rails_helper"

RSpec.describe BestBuyService do
  it "returns products" do
    VCR.use_cassette("best_buy_service#index") do
      service = BestBuyService.new
      result = service.index
    end
  end
end
