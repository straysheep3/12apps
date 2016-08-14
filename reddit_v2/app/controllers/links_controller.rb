# LinksController
class LinksController < ApplicationController
  before_action :find_links, except: [:index, :new, :create]

  def index
    @links = Link.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @link = current_user.links.build
  end

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      redirect_to @link
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to @link
    else
      render 'edit'
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path
  end

  def upvote
    @link.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @link.downvote_by current_user
    redirect_to :back
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def find_links
    @link = Link.find(params[:id])
  end
end
