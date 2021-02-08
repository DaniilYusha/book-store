class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :merge_order_items, :header_presenter

  rescue_from ActiveRecord::RecordNotFound, ActiveRecord::ActiveRecordError do |_exception|
    flash[:alert] = I18n.t('alert.something_wrong')
    redirect_back fallback_location: root_path
  end

  private

  def header_presenter
    @header_presenter = HeaderPresenter.new(order: current_order&.decorate)
  end

  def merge_order_items
    return unless user_signed_in?

    MergeOrdersService.new(guest_order_id: cookies[:order_id], user: current_user).call
    cookies.delete(:order_id)
  end

  def current_order
    return Order.includes(order_items: [:book]).find_by(id: cookies[:order_id]) unless user_signed_in?

    current_user.orders.includes(order_items: [:book]).find_by(status: Order.statuses[:pending])
  end

  def redirect_back_with_flash(flash_type, message)
    flash[flash_type] = message
    redirect_back fallback_location: root_path
  end
end
