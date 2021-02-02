class OrderItemsController < ApplicationController
  def create
    persist_order_items(message: I18n.t('notice.book.added_to_order'), set_cookie: true)
  end

  def update
    persist_order_items(message: I18n.t('notice.book.count_changed'))
  end

  def destroy
    service = DestroyOrderItemService.new(item_id: params[:id], order: current_order)
    service.call
    cookies.delete(:order_id) if service.order_destroyed?
    redirect_to(cart_path, notice: I18n.t('notice.book.deleted'))
  end

  private

  def persist_order_items(message:, set_cookie: false)
    service = PersistOrderItemService.new(params: order_item_params, order: current_order)
    return redirect_back_with_flash(:alert, service.errors.full_messages.to_sentence) unless service.call

    cookies[:order_id] = service.order.id if set_cookie && current_order.nil?
    redirect_back_with_flash(:notice, message)
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :book_id)
  end
end
