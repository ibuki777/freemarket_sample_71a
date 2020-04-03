class SearchesController < ApplicationController
  def index
    @products = Product.search(params[:keyword])
    @search = params[:keyword]
    @searches = Product.all.page(params[:page]).per(1)
  end
end
