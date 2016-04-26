class BestBuyService
  def initialize
    connection.params["api_key"] = ["BEST_BUY_API_KEY"]
  end

  def products
    
  end

  private
    def connection
      @_connection ||= Faraday.new("https://api.bestbuy.com")
    end
end
