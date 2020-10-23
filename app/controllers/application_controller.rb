class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_categories, :set_countries

  private

  def set_categories
    @categories = Category.with_books.all
  end

  def set_countries
    @countries = ISO3166::Country.all.sort_by(&:name)
  end
end
