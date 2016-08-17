class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :delete]

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to :back
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:link_id, :body, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
