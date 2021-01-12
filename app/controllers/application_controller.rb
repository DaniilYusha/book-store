class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_categories, :set_cart

  private

  def set_categories
    @categories = Category.all
  end

  def set_cart
    if user_signed_in?
      @cart = current_user.cart || current_user.create_cart
    elsif cookies[:cart_id]
      @cart = Cart.find_by(id: cookies[:cart_id])
    else
      @cart = Cart.create
      cookies[:cart_id] = @cart.id
    end
    @cart = @cart.decorate
  end
end
