class CardsController < ApplicationController
  require "payjp"
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
  before_action :set_card

  def index
    # すでにクレジットカードが登録しているか？
    if @card.present?
      # 登録している場合,PAY.JPからカード情報を取得する
      # PAY.JPの秘密鍵をセットする。
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      # PAY.JPから顧客情報を取得する。
      customer = Payjp::Customer.retrieve(@card.payjp_id)
      # PAY.JPの顧客情報から、デフォルトで使うクレジットカードを取得する。
      @card_info = customer.cards.retrieve(customer.default_card)
      # クレジットカード情報から表示させたい情報を定義する。
      # クレジットカードの画像を表示するために、カード会社を取得
      @card_brand = @card_info.brand
      # クレジットカードの有効期限を取得
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 

      # クレジットカード会社を取得したので、カード会社の画像をviewに表示させるため、ファイルを指定する。
      # case @card_brand
      # when "Visa"
      #   @card_image = "visa.svg"
      # when "JCB"
      #   @card_image = "jcb.svg"
      # when "MasterCard"
      #   @card_image = "master-card.svg"
      # when "American Express"
      #   @card_image = "american_express.svg"
      # when "Diners Club"
      #   @card_image = "dinersclub.svg"
      # when "Discover"
      #   @card_image = "discover.svg"
      # end
    end
  end

  def new
    # cardがすでに登録済みの場合、indexのページに戻します。
    @card = Card.where(user_id: current_user.id).first
    # redirect_to action: "index" if @card.present?    
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    if params['payjpToken'].blank?
      # トークンが空なら戻す
      render "new"
    else
      # トークンがちゃんとあれば進めて、PAY.JPに登録されるユーザーを作成します。
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

  # カード情報の編集のリクエストを送るのに使うかも
  # def edit
  # end

  # カード情報の破棄の際に使用予定
  # def destroy
  # end

  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
