class Product

  def service
    BestBuyService.new
  end

  def self.find_by(search_text)
    params = {
      sort: "name.asc",
      show: "name,customerReviewAverage,shortDescription,salePrice,image,sku",
      pageSize: "15",
      format: "json"
    }
    binding.pry
    service.products(search_text, params)
  end
end
