class PersistOrderItemService
  attr_reader :order

  def initialize(params:, order:)
    @params = params
    @order = order
  end

  def call
    @order ||= Order.create
    item = find_item
    item ? update_item(item) : create_item
  end

  private

  attr_reader :params

  def find_item
    order.order_items.find_by(book_id: params[:book_id])
  end

  def create_item
    order.order_items.create(params)
  end

  def update_item(item)
    item.quantity += params[:quantity].to_i
    item.save
  end
end
