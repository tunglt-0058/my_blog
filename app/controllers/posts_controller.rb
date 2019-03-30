class PostsController < ApplicationController
  before_action :find_post, only: :show
  before_action :authenticate_user!, only: [:new, :create]
  skip_before_action :verify_authenticity_token

  def index
    @posts = Post.paginate(page: params[:page], per_page: Settings.page_posts_size).order(id: :desc)
  end

  def show
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new post_params
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = t "post_create.success"
      redirect_to @post
    else
      respond_to do |format|
        format.html do
          flash[:danger] = t "post_create.fail"
          redirect_to root_path
        end
        format.js
      end
    end
  end

  private
  def post_params
    params.require(:post).permit :title, :content, :image_url, :category_id
  end

  def find_post
    @post = Post.find_by_slug(params[:slug])
    unless @post
      flash[:danger] = t "not_found.post"
      redirect_to not_found_index_path
    end
  end
end
