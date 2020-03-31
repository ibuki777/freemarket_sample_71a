class OrdersController < ApplicationController
  before_action :set_product
  before_action :set_card

  def new
    @order = Order.new
    @amount = @product.price

  end

  def create

      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY) 
      # 請求を発行
      Payjp::Charge.create(
      amount: @product.price,
      customer: @card.customer_id,
      currency: 'jpy',
      )
      # 売り切れなので、productの情報をアップデートして売り切れにします。
      @order = Order.new(user_id: current_user.id, product_id: @product.id, address_id: current_user.address.id)
      if @order.save
        flash[:notice] = '購入しました。'
        redirect_to controller: 'products', action: 'show', id: @product.id
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: 'products', action: 'show', id: @product.id
      end
    end

  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
