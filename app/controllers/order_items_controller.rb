class OrderItemsController < ApplicationController
  def create
    service = PersistOrderItemService.new(params: order_item_params, order: current_order)
    cookies[:order_id] = service.order.id unless current_order
    call_service(service)
  end

  def update
    service = PersistOrderItemService.new(params: order_item_params, order: current_order)
    call_service(service)
  end

  def destroy
    service = DestroyOrderItemService.new(item_id: params[:id], order: current_order)
    return redirect_back_with_flash(:alert, I18n.t('alert.something_wrong')) unless service.call

    cookies.delete(:order_id) if service.order_destroyed?
    redirect_to(cart_path, notice: I18n.t('notice.book.deleted'))
  end

  private

  def call_service(service)
    return redirect_back_with_flash(:alert, service.errors.full_messages.to_sentence) unless service.call

    redirect_back_with_flash(:notice, I18n.t('notice.book.count_changed'))
  end

  def redirect_back_with_flash(flash_type, message)
    flash[flash_type] = message
    redirect_back fallback_location: root_path
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :book_id)
  end
end
