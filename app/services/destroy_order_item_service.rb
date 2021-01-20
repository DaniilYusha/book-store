class DestroyOrderItemService
  attr_reader :errors
  
  def initialize(item_id:, order:)
    @id = item_id
    @order = order
    @errors = []
  end

  def call
    delete_order_item
    destroy_order
  end

  def order_destroyed?
    order.destroyed?
  end

  private

  attr_reader :id, :order

  def delete_order_item
    order_item ? order_item.delete : @errors << I18n.t('alert.something_wrong')
  end

  def destroy_order
    order.destroy if order.order_items.empty?
  end

  def order_item
    @order_item ||= order.order_items.find_by(id: id)
  end
end
