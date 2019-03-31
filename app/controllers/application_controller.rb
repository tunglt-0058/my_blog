class ApplicationController < ActionController::Base
  before_action :load_data_static

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500

  def render_404
    redirect_to not_found_index_path
  end

  def render_500
    render template: 'public/500', status: 500, layout: 'application', content_type: 'text/html'
  end

  private
  def load_data_static
    @categories = Category.all
  end
end
