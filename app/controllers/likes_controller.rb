class LikesController < ApplicationController
  before_action :set_variables

  def like
    like = current_user.likes.new(product_id: @product.id)
    if like.save
      flash.now[:alert] = 'お気に入りに登録しました'
    else
      flash.now[:alert] = 'システムエラー   もう一度お試しください'
    end
  end

  def unlike
    like = current_user.likes.find_by(product_id: @product.id)
    if like.destroy
      flash.now[:alert] = 'お気に入りから解除しました'
    else
      flash.now[:alert] = 'システムエラー   もう一度お試しください'
    end
  end

  private

  def set_variables
    @product = Product.find(params[:product_id])
    @id_name = "#like-link-#{@product.id}"
  end
end
