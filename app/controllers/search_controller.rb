class SearchController < ApplicationController
  def index
    @products = Product.find_by(params[:search])
  end
end
