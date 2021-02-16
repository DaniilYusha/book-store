class OrdersController < ApplicationController
  def index
    @orders = SortedOrdersQuery.new(relation: current_user.orders, sort_by: orders_params[:sort_by]).call.decorate
    @presenter = OrdersPresenter.new
  end

  def show
    @order = Order.includes(order_items: [:book]).find(params[:id]).decorate
  end

  private

  def orders_params
    params.permit(:sort_by)
  end
end
