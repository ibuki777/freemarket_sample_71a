class CardsController < ApplicationController
  require "payjp"
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
  before_action :set_card

  def index
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.payjp_id)
      @card_info = customer.cards.retrieve(customer.default_card)
      @card_brand = @card_info.brand
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 

    end
  end

  def new
    @card = Card.where(user_id: current_user.id).first
    redirect_to action: "index" if @card.present?    
  end

  def create
    if params['payjpToken'].blank?
      render "new" ,notice:"登録に失敗しました"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        card: params['payjpToken'],
        metadata: {user_id: current_user.id}
      )


      # PAY.JPのユーザーが作成できたので、creditcardモデルを登録します。
      @card = Card.new(user_id: current_user.id, payjp_id: customer.id)
      if @card.save
        redirect_to action: "index", notice:"支払い情報の登録が完了しました"
      else
        render 'new'
      end
    end
  end

  def destroy
    customer = Payjp::Customer.retrieve(@card.payjp_id)
    customer.delete

    if @card.destroy 
      redirect_to action: "index", notice: "削除しました"
    else
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end

  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
