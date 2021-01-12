class CartItemsController < ApplicationController
  def create
    PersistCartItemService.new(params: cart_item_params, cart: @cart).call
    redirect_back_with_flash(I18n.t('notice.book.added_to_cart'))
  end

  def update
    UpdateCartItemService.new(id: params[:id], quantity: cart_item_params[:quantity]).call
    redirect_back_with_flash(I18n.t('notice.book.count_changed'))
  end

  def destroy
    CartItem.find_by(id: params[:id]).destroy
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
