class PersistOrderItemService
  attr_reader :order, :errors

  def initialize(params:, order:)
    @params = params
    @order = order || Order.new
    @errors = []
  end

  def call
    item ? update_item(item) : create_item

    errors.empty?
  end

  private

  attr_reader :params, :order_item_form

  def item
    @item ||= order.order_items.find_by(book_id: params[:book_id])
  end

  def create_item
    return @errors = order_item_form.errors unless quantity_valid?(params)

    order.order_items.build(params)
    order.save
  end

  def update_item(item)
    item.quantity += params[:quantity].to_i
    quantity_valid?(item.attributes) ? item.save : @errors = order_item_form.errors
  end

  def quantity_valid?(params)
    @order_item_form = OrderItemForm.new(params)
    order_item_form.valid?
  end
end
