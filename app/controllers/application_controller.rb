class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_categories

  private

  def set_categories
    @categories = Category.all
  end
end
