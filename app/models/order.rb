class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_one :coupon, dependent: :nullify

  belongs_to :user, optional: true
end
