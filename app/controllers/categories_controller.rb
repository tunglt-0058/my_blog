class CategoriesController < ApplicationController
  before_action :find_category, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  skip_before_action :verify_authenticity_token

  def index
    @categories = Category.paginate(page: params[:page], per_page: Settings.page_posts_size).order(id: :desc)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "category_create.success"
      redirect_to @category
    else
      respond_to do |format|
        format.html do
          flash[:danger] = t "category_create.fail"
          redirect_to root_path
        end
        format.js
      end
    end
  end

  def edit
  end

  def update
    @category.update_attributes(category_params) ? flash[:success] = t("category_update.success") : flash[:danger] = t("category_update.fail")
    redirect_to @category
  end

  def destroy
    @category.destroy ? flash[:success] = t("category_delete.success") : flash[:danger] = t("category_delete.fail")
    redirect_to root_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def find_category
    @category = Category.find_by_slug(params[:slug])
    if @category.present?
      @category_posts = @category.posts.paginate(page: params[:page], per_page: Settings.page_posts_size).order(id: :desc)
    else
      flash[:danger] = t "not_found.category"
      redirect_to not_found_index_path
    end
  end
end
