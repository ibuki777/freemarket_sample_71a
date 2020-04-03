class LikesController < ApplicationController
  before_action :set_variables

  def like
    if current_user
      like = current_user.likes.new(product_id: @product.id)
      like.save
    else
      redirect_to root_path
    end
  end

  def unlike
    if current_user
      like = current_user.likes.find_by(product_id: @product.id)
      like.destroy
    else
      redirect_to root_path
    end
  end

  private

  def set_variables
    @product = Product.find(params[:product_id])
    @id_name = "#like-link-#{@product.id}"
  end
end
