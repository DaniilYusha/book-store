class MergeOrdersService
  def initialize(guest_order:, user_order:)
    @guest_order = guest_order
    @user_order = user_order
  end

  def call
    guest_order.order_items.each do |guest_item|
      user_order_has_guest_item?(guest_item) ? update_user_item_quantity(guest_item) : update_guest_item(guest_item)
    end
  end

  private

  attr_reader :guest_order, :user_order

  def update_user_item_quantity(guest_item)
    user_order_item = user_order.order_items.find_by(book_id: guest_item.book_id)
    user_order_item.update(quantity: user_order_item.quantity + guest_item.quantity)
  end

  def update_guest_item(guest_item)
    guest_item.update(order_id: user_order.id)
  end

  def user_order_has_guest_item?(guest_item)
    user_order.order_items.pluck(:book_id).include?(guest_item.book_id)
  end
end
