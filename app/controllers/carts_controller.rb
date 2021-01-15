class CartsController < ApplicationController
  def index
    @cart = current_cart&.decorate
    @cart_items = current_cart&.cart_items&.includes(:book)&.decorate
  end
end
