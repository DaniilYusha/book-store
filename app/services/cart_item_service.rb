class CartItemService
  def initialize(params)
    @params = params
  end

  def call
    item = find_item
    item.blank? ? CartItem.create(@params) : update_item(item)
  end

  private

  def find_item
    CartItem.find_by(book_id: @params[:book_id], cart_id: @params[:cart_id])
  end

  def update_item(item)
    new_quantity = item.quantity + @params[:quantity].to_i
    item.update(quantity: new_quantity)
  end
end
