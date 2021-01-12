class CartsController < ApplicationController
  def index
    @cart_items = @cart.cart_items.includes(:book).decorate
  end
end
