class PostsController < ApplicationController
  before_action :find_post, only: :show
  def index
    @posts = Post.paginate(page: params[:page], per_page: Settings.page_posts_size).order(id: :desc)
  end

  def show
  end

  private
  def find_post
    @post = Post.find(params[:id])
    unless @post
      flash[:danger] = t"not_found.post"
      redirect_to not_found_index_path
    end
  end
end
