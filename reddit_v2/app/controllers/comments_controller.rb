class CommentsController < ApplicationController
  before_action :find_links

  def new
    @comment = @link.comments.build
  end

  def create
    @comment = @link.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to :back
    else
      render 'new'
    end
  end

  private

  def find_links
    @link = Link.find(params[:link_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
