class SearchesController < ApplicationController
  def index
    @products = Product.search(params[:keyword]).limit(30)
    @search = params[:keyword]
  end
end
