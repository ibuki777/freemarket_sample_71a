class OrdersController < ApplicationController
  before_action :set_product

  def new
    @order = Order.new

  end

  def create
   
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

end
