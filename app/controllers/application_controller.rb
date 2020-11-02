class ApplicationController < ActionController::Base
  protect_from_forgery

  include Pagy::Backend

  before_action :set_categories

  private

  def set_categories
    @categories = Category.includes(:books).all
  end
end
