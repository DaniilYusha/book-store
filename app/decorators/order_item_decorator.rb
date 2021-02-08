class OrderItemDecorator < ApplicationDecorator
  delegate_all

  decorates_association :book

  def subtotal_price
    object.quantity * object.book.price
  end
end
