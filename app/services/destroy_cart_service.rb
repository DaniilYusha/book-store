class DestroyCartService
  def initialize(item_id:, cart:)
    @id = item_id
    @cart = cart
  end

  def call
    cart.cart_items.find_by(id: id).delete
    cart.destroy if cart.cart_items.blank?
  end

  def cart_destroyed?
    cart.destroyed?
  end

  private

  attr_reader :id, :cart
end
