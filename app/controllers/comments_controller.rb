class CommentsController < ApplicationController

  def create
    if comment_params["user_id"] != ""
      user = User.find(comment_params["user_id"])
      comment = Comment.create(comment_params)
      comment.user = user
      comment.save
    else
      comment = Comment.create(comment_params)
    end
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
