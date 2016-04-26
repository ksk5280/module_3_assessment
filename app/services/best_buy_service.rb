class BestBuyService
  def initialize
    connection.params["apiKey"] = ENV["BEST_BUY_API_KEY"]
  end

  def products(search_text, params=nil)
    parse(connection.get("v1/products((search=#{search_text}))", params))
  end

  private
    def connection
      @_connection ||= Faraday.new("https://api.bestbuy.com")
    end

    def parse(response)
      JSON.parse(response.body).deep_symbolize_keys
    end
end
