class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_categories, :set_countries

  private

  def set_categories
    @categories = Category.all
  end

  def set_countries
    @countries = ISO3166::Country.all.sort_by(&:name)
  end
end
