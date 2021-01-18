class OrdersController < ApplicationController
  def index
    @order = current_order&.decorate
    @order_items = current_order&.order_items&.includes(:book)&.decorate
  end
end
