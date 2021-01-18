class UpdateOrderItemService
  INCREMENT = 1
  DECREMENT = -1

  def initialize(id:, quantity:)
    @id = id
    @quantity = quantity.to_i
  end

  def call
    update_item if item
  end

  private

  attr_reader :id, :quantity

  def item
    @item ||= OrderItem.find_by(id: id)
  end

  def update_item
    item.quantity += quantity
    item.save if item.quantity.positive?
  end
end
