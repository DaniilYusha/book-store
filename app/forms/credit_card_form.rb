class CreditCardForm
  include ActiveModel::Model
  include Virtus.model

  attribute :number, String
  attribute :name, String
  attribute :date, String
  attribute :cvv, Integer

  CARD_NUMBER_LENGTH = 16
  NAME_MAX_LENGTH = 50
  NAME_REGEX = /\A[a-zA-Z\s]+\z/.freeze
  DATE_REGEX = %r{\A(0[1-9]|1[0-2])/([0-9]{2})\z}.freeze
  CVV_MIN_LENGTH = 3
  CVV_MAX_LENGTH = 4

  validates :number, :name, :date, :cvv, presence: true
  validates :number, length: { is: CARD_NUMBER_LENGTH }, numericality: { only_integer: true }
  validates :name, length: { maximum: NAME_MAX_LENGTH }, format: { with: NAME_REGEX }
  validates :date, format: { with: DATE_REGEX }
  validates :cvv, length: { minimum: CVV_MIN_LENGTH, maximum: CVV_MAX_LENGTH }, numericality: { only_integer: true }
end
