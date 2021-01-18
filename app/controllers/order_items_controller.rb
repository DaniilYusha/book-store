class OrderItemsController < ApplicationController
  def create
    service = PersistOrderItemService.new(params: order_item_params, order: current_order)
    service.call
    cookies[:order_id] = service.order.id
    redirect_back_with_flash(I18n.t('notice.book.added_to_order'))
  end

  def update
    UpdateOrderItemService.new(id: params[:id], quantity: order_item_params[:quantity]).call
    redirect_back_with_flash(I18n.t('notice.book.count_changed'))
  end

  def destroy
    service = DestroyOrderItemService.new(item_id: params[:id], order: current_order)
    service.call
    cookies.delete(:order_id) if service.order_destroyed?
    redirect_to(orders_path, notice: I18n.t('notice.book.deleted'))
  end

  private

  def redirect_back_with_flash(message)
    flash.notice = message
    redirect_back fallback_location: root_path
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :book_id)
  end
end
