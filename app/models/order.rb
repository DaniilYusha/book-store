class Order < ApplicationRecord
  enum status: { processing: 0, address: 1, delivery: 2, payment: 3, confirmation: 4, complete: 5 }

  has_many :order_items, dependent: :destroy
  has_one :coupon, dependent: :nullify

  belongs_to :user, optional: true
end
