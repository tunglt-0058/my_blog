class BookmarksController < ApplicationController
  def index
    if current_user && user_signed_in?
      @bookmark_posts = current_user.bookmark_posts.paginate(page: params[:page], per_page: Settings.page_posts_size).order(id: :desc)
    else
      redirect_to not_found_index_path
    end 
  end
end
