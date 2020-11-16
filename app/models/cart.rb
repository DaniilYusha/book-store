class Cart < ApplicationRecord
  has_many :cart_items
  has_one :coupon

  belongs_to :user, optional: true
end
