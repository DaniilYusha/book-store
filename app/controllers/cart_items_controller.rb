class CartItemsController < ApplicationController
  def create
    CartItemService.new(cart_item_params).call
    redirect_back fallback_location: root_path
  end

  def destroy
    CartItem.find_by(id: params[:id]).destroy
    redirect_to(cart_path, notice: I18n.t('notice.book.deleted'))
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :book_id).merge(cart_id: @cart.id)
  end

  def update_item(item)
    new_quantity = item.quantity + cart_item_params[:quantity].to_i
    item.update(quantity: new_quantity)
  end
end
