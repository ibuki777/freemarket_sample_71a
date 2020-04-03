class SearchesController < ApplicationController
  def index
    @products = Product.search(params[:keyword]).page(params[:page]).per(9)
    @search = params[:keyword]
  end
end
