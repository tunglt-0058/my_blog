class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  skip_before_action :verify_authenticity_token

  def index
    @posts = Post.paginate(page: params[:page], per_page: Settings.page_posts_size).order(id: :desc)
  end

  def show
    @recommend_posts = @post.recommend_posts.limit(Settings.load_recommend_posts).shuffle
  end

  def new
    @post = Post.new
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
  def edit
  end

  def update
    @post.update_attributes(post_params) ? flash[:success] = t("post_update.success") : flash[:danger] = t("post_create.fail")
    redirect_to @post
  end

  def destroy
    @post.destroy ? flash[:success] = t("post_delete.success") : flash[:danger] = t("post_delete.fail")
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit :title, :summary, :content, :image, :category_id, tag_ids: []
  end

  def find_post
    @post = Post.find_by_slug(params[:slug])
    unless @post
      flash[:danger] = t "not_found.post"
      redirect_to not_found_index_path
    end
  end
end
