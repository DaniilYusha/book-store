class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_one :coupon, dependent: :destroy

  belongs_to :user, optional: true
end
