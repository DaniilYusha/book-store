class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :header_presenter, :current_order

  private

  def header_presenter
    @header_presenter = HeaderPresenter.new(order: current_order&.decorate)
  end

  def current_order
    order = Order.find_by(id: cookies[:order_id])
    return order unless user_signed_in?

    set_order_to_user(order, current_user.orders.find_by(status: :processing)) if order
    current_user.orders.find_by(status: :processing)
  end

  def set_order_to_user(order, user_order)
    if user_order
      MergeOrdersService.new(order: order, user_order: user_order).call
      Order.destroy(cookies[:order_id])
    else
      current_user.orders << order
    end
    cookies.delete(:order_id)
  end
end
