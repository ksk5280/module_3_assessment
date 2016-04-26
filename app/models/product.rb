class Product < OpenStruct

  def self.service
    BestBuyService.new
  end

  def self.find_by(search_text)
    params = {
      show: "name,customerReviewAverage,shortDescription,salePrice,image,sku",
      pageSize: "15",
      format: "json"
    }
    data = service.products(search_text, params)

    a = data[:products].map do |product|
      new(product)
    end
  end
end
