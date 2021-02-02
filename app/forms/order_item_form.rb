class OrderItemForm
  include ActiveModel::Model
  include Virtus.model

  INVALID_QUANTITY = 0

  attribute :quantity, Integer

  validates :quantity, numericality: { greater_than: INVALID_QUANTITY }
end
