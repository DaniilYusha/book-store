class PersistOrderItemService
  attr_reader :order, :errors

  def initialize(params:, order:)
    @params = params
    @order = order
    @errors = []
  end

  def call
    @order ||= Order.create
    item ? update_item(item) : create_item

    errors.empty?
  end

  private

  attr_reader :params

  def item
    @item ||= order.order_items.find_by(book_id: params[:book_id])
  end

  def create_item
    order.order_items.create(params)
  end

  def update_item(item)
    @errors << I18n.t('alert.something_wrong') unless item.update(quantity: item.quantity + params[:quantity].to_i)
  end
end
