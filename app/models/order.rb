class Order < ApplicationRecord
  include AASM

  enum status: { processing: 0, address: 1, delivery: 2, payment: 3, confirmation: 4, complete: 5 }

  has_many :order_items, dependent: :destroy
  has_one :coupon, dependent: :nullify

  belongs_to :user, optional: true

  aasm column: :status, enum: true do
    state :processing, initial: true
    state :address
    state :delivery
    state :payment
    state :confirmation
    state :complete

    event :to_address do
      transitions from: :processing, to: :address
    end

    event :delivery do
      transitions from: :address, to: :delivery
    end

    event :payment do
      transitions from: :delivery, to: :payment
    end

    event :confirmation do
      transitions from: :payment, to: :confirmation
    end

    event :complete do
      transitions from: :confirmation, to: :complete
    end
  end
end
