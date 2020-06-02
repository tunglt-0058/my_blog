class TagsController < ApplicationController
  before_action :find_tag, only: :show

  def show
  end

  private
  def find_tag
    tag = Tag.find_by_slug(params[:slug])
    if tag.present?
      @tag_posts = tag.posts.paginate(page: params[:page], per_page: Settings.page_tags_show_size).order(id: :desc)
    else
      flash[:danger] = t "not_found.tag"
      redirect_to not_found_index_path
    end
  end
end
