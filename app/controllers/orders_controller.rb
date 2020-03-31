class OrdersController < ApplicationController
  before_action :set_product
  before_action :set_card

  def new
    @order = Order.new
    @amount = @product.price

  end

  def create
    # すでに購入されていないか？→＠productのsoldカラムが売り切れを示している
    # if @product.buyer.present? 
    #   redirect_back(fallback_location: root_path) 
    # elsif @card.blank?
    #   # カード情報がなければ、クレジットカードの登録に飛ばす
    #   redirect_to new_card_path
    #   flash[:alert] = '購入にはクレジットカード登録が必要です。登録後、再度購入してください'
    # else
      # 購入者もいないし、クレジットカードもあるし、決済処理に移行
      require "payjp"
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
