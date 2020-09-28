class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_categories

  private

  def set_categories
    @categories = Category.with_books.all
  end
end
