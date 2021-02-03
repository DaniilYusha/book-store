class OrderDecorator < ApplicationDecorator
  delegate_all
  decorates_association :order_items

  DEFAULT_PRICE = 0.00
  PERCENTAGE_DIVIDER = 100

  def items_count
    object.order_items.map(&:quantity).sum
  end

  def subtotal_price
    object.order_items.map { |item| item.quantity * item.book.price }.sum
  end

  def coupon_discount
    object.coupon ? (subtotal_price * object.coupon.discount / PERCENTAGE_DIVIDER) : DEFAULT_PRICE
  end

  def delivery_price
    object.delivery ? object.delivery.price : DEFAULT_PRICE
  end

  def order_total
    subtotal_price - coupon_discount + delivery_price
  end
end
