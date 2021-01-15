class CartItemsController < ApplicationController
  def create
    service = PersistCartService.new(params: cart_item_params, cart: current_cart)
    service.call
    cookies[:cart_id] = service.cart.id
    redirect_back_with_flash(I18n.t('notice.book.added_to_cart'))
  end

  def update
    UpdateCartService.new(id: params[:id], quantity: cart_item_params[:quantity]).call
    redirect_back_with_flash(I18n.t('notice.book.count_changed'))
  end

  def destroy
    service = DestroyCartService.new(item_id: params[:id], cart: current_cart)
    service.call
    cookies.delete(:cart_id) if service.cart_destroyed?
    redirect_to(carts_path, notice: I18n.t('notice.book.deleted'))
  end

  private

  def redirect_back_with_flash(message)
    flash.notice = message
    redirect_back fallback_location: root_path
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :book_id)
  end
end
