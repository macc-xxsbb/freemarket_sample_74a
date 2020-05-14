class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    # @comments = @user.comments.includes(:user)
    Comment.create(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
