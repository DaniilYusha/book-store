class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_categories, :header_presenter, :current_order

  private

  def set_categories
    @categories = Category.all
  end

  def header_presenter
    @header_presenter = HeaderPresenter.new(order: current_order)
  end

  def current_order
    Order.find_by(id: cookies[:order_id])&.decorate
  end
end
