class Order < ApplicationRecord
  include AASM

  enum status: { pending: 0, address: 1, delivery: 2, payment: 3, confirm: 4, complete: 5 }

  has_many :order_items, dependent: :destroy
  has_one :coupon, dependent: :nullify
  has_one :credit_card, dependent: :destroy

  belongs_to :user, optional: true
  belongs_to :delivery, optional: true

  aasm column: :status, enum: true do
    state :pending, initial: true
    state :address
    state :delivery
    state :payment
    state :confirm
    state :complete

    event :to_address do
      transitions from: :pending, to: :address
    end

    event :fill_delivery do
      transitions from: :address, to: :delivery
    end

    event :payment do
      transitions from: :delivery, to: :payment
    end

    event :confirmation do
      transitions from: :payment, to: :confirm
    end

    event :complete do
      transitions from: :confirm, to: :complete
    end
  end
end
