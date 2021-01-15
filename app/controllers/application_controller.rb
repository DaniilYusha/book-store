class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_categories, :header_presenter, :current_cart

  private

  def set_categories
    @categories = Category.all
  end

  def header_presenter
    @header_presenter = HeaderPresenter.new(cart: current_cart)
  end

  def current_cart
    Cart.find_by(id: cookies[:cart_id])&.decorate
  end
end
