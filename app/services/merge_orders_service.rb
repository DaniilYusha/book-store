class MergeOrdersService
  def initialize(order:, user_order:)
    @order = order
    @user_order = user_order
  end

  def call
    update_user_items(user_order.order_items, order.order_items) if orders_have_same_items?
    create_user_items(user_order, order.order_items) if order_contains_new_items?
  end

  private

  attr_reader :order, :user_order

  def create_user_items(user_order, order_items)
    order_items.each do |order_item|
      unless user_order.order_items.any? { |user_order_item| user_order_item.book_id == order_item.book_id }
        user_order.order_items << order_item
      end
    end
  end

  def update_user_items(user_order_items, order_items)
    order_items.each do |order_item|
      user_order_items.where(book_id: order_item.book_id).each do |user_order_item|
        user_order_item.update(quantity: user_order_item.quantity + order_item.quantity)
      end
    end
  end

  def orders_have_same_items?
    (user_order.order_items.map(&:book_id) & order.order_items.map(&:book_id)).any?
  end

  def order_contains_new_items?
    (order.order_items.map(&:book_id) - user_order.order_items.map(&:book_id)).any?
  end
end
