class CategoriesController < ApplicationController
  before_action :find_category, only: :show

  def show
  end

  private
  def find_category
    @category = Category.find_by_slug(params[:slug])
    unless @category
      flash[:danger] = t"not_found.category"
      redirect_to not_found_index_path
    end
  end
end
