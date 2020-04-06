class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/product/#{comment.tweet.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
