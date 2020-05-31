class CategoriesController < ApplicationController
  before_action :find_category, only: :show

  def show
  end

  private
  def find_category
    category = Category.find_by_slug(params[:slug])
    if category.present?
      @category_posts = category.posts.paginate(page: params[:page], per_page: Settings.page_posts_size).order(id: :desc)
    else
      flash[:danger] = t "not_found.category"
      redirect_to not_found_index_path
    end
  end
end
