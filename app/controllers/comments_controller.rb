class CommentsController < ApplicationController

  def index
    @comment = Comment.includes(:user)
  end

  def create
    # comment = Comment.create(comment_params)
    # redirect_to "/products/#{comment.product.id}"
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to product_path(params[:product_id])  }
      format.json
    end
  end


  # def new
  # end

  # def create
  #   @comment = Comment.new(comment_params)
  #   if @comment.save
  #     redirect_to "/products/#{comment.product.id}"
  #   else
  #     @product.comment.new
  #     render action: :new
  #   end
  # end


  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
