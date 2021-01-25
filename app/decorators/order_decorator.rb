class OrderDecorator < ApplicationDecorator
  delegate_all
  decorates_association :order_items

  DEFAULT_DISCOUNT = 0.00
  DIVIDER = 100

  def items_count
    object.order_items.map(&:quantity).sum
  end

  def subtotal_price
    object.order_items.map { |item| item.decorate.subtotal_price }.sum
  end

  def coupon_discount
    object.coupon ? (subtotal_price * object.coupon.discount / DIVIDER).floor(2) : DEFAULT_DISCOUNT
  end

  def order_total
    subtotal_price - coupon_discount
  end
end
