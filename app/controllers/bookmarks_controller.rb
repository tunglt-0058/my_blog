class BookmarksController < ApplicationController
  def index
    if current_user && user_signed_in?
      @bookmark_posts = current_user.bookmark_posts.paginate(page: params[:page], per_page: Settings.page_posts_size).order(id: :desc)
    else
      redirect_to not_found_index_path
    end 
  end

  def checked
    @post = Post.find(params[:id])
    current_user.add_bookmark(@post)
    respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js { render layout: false }
    end    
  end
  
  def un_checked
    @post = Post.find(params[:id])
    current_user.remove_bookmark(@post)
    respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js { render layout: false }
    end
  end
end
