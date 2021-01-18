class DestroyOrderItemService
  def initialize(item_id:, order:)
    @id = item_id
    @order = order
  end

  def call
    order.order_items.find_by(id: id).delete
    order.destroy if order.order_items.blank?
  end

  def order_destroyed?
    order.destroyed?
  end

  private

  attr_reader :id, :order
end
