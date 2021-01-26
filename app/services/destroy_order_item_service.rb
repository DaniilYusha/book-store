class DestroyOrderItemService
  def initialize(item_id:, order:)
    @id = item_id
    @order = order
  end

  def call
    order_item.delete
    order.destroy if order.order_items.empty?

    order_item.destroyed?
  end

  def order_destroyed?
    order.destroyed?
  end

  private

  attr_reader :id, :order

  def order_item
    @order_item ||= order.order_items.find(id)
  end
end
