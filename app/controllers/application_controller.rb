class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :merge_orders, :current_order, :header_presenter

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    flash[:alert] = I18n.t('alert.something_wrong')
    redirect_back fallback_location: root_path
  end

  private

  def header_presenter
    @header_presenter = HeaderPresenter.new(order: current_order&.decorate)
  end

  def merge_orders
    return unless user_signed_in?

    MergeOrdersService.new(guest_order_id: cookies[:order_id], user: current_user).call
    cookies.delete(:order_id)
  end

  def current_order
    user_signed_in? ? current_user.orders.find_by(status: :pending) : Order.find_by(id: cookies[:order_id])
  end
end
