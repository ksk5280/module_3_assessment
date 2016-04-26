class BestBuyService
  def initialize
    binding.pry
    @_connection = Faraday.new("https://api.bestbuy.com")
    connection.params["api_key"] = ENV["BEST_BUY_API_KEY"]
  end

  def products(params=nil)
    parse(connection.get("v1/products", params))
  end

  private
    def connection
      @_connection
      # @_connection ||= Faraday.new("https://api.bestbuy.com")
    end

    def parse(response)
      binding.pry
      JSON.parse(response.body).deep_symbolize_keys
    end
end


# https://api.bestbuy.com/v1/products?
    # sort=name.asc&
    # show=name,customerReviewAverage,shortDescription,salePrice,image,sku&
    # facet=name&
    # pageSize=15&
    # callback=JSON_CALLBACK&
    # format=json
