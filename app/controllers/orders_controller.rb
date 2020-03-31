class OrdersController < ApplicationController
  before_action :set_product
  before_action :set_card

  def new
    @order = Order.new

  end

  def create
   
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
