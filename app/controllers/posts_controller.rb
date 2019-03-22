class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: Settings.page_posts_size).order(id: :desc)
  end
end
