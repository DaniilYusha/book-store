class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_one :coupon, dependent: :nullify

  belongs_to :user, optional: true
end
