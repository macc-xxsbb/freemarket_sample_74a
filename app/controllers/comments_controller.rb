class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    Comment.create(comment_params)
    redirect_to "/items/#{comment.tweet.id}" 
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
