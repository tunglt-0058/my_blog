class TagsController < ApplicationController
  before_action :find_tag, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  skip_before_action :verify_authenticity_token

  def index
    @tags = Tag.paginate(page: params[:page], per_page: Settings.page_posts_size).order(id: :desc)
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new tag_params
    if @tag.save
      flash[:success] = t "tag_create.success"
      redirect_to @tag
    else
      respond_to do |format|
        format.html do
          flash[:danger] = t "tag_create.fail"
          redirect_to root_path
        end
        format.js
      end
    end
  end

  def edit
  end

  def update
    @tag.update_attributes(tag_params) ? flash[:success] = t("tag_update.success") : flash[:danger] = t("tag_update.fail")
    redirect_to @tag
  end

  def destroy
    @tag.destroy ? flash[:success] = t("tag_delete.success") : flash[:danger] = t("tag_delete.fail")
    redirect_to root_path
  end
  private

  def tag_params
    params.require(:tag).permit :title
  end

  def find_tag
    @tag = Tag.find_by_slug(params[:slug])
    if @tag.present?
      @tag_posts = @tag.posts.paginate(page: params[:page], per_page: Settings.page_tags_show_size).order(id: :desc)
    else
      flash[:danger] = t "not_found.tag"
      redirect_to not_found_index_path
    end
  end
end
