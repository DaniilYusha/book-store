class CartDecorator < ApplicationDecorator
  delegate_all

  def items_count
    object.cart_items.map(&:quantity).sum
  end

  def subtotal_price
    object.cart_items.map { |item| item.decorate.subtotal_price }.sum
  end

  def coupon_discount
    object.coupon.nil? ? 0.00 : (subtotal_price * object.coupon.discount / 100).floor(2)
  end

  def order_total
    subtotal_price - coupon_discount
  end
end
