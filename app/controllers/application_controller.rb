class ApplicationController < ActionController::Base
  before_action :load_data_static

  private
  def load_data_static
    @categories = Category.all
  end
end
