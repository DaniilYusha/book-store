class ReviewForm
  include ActiveModel::Model
  include Virtus.model

  attribute :title, String
  attribute :text, String
  attribute :rating, Integer
  attribute :book_id, Integer
  attribute :user_id, Integer

  TITLE_MAX_LENGTH = 80
  TEXT_MAX_LENGTH = 500
  MIN_RATING = 1
  MAX_RATING = 5
  RATING_RANGE = (MIN_RATING..MAX_RATING).freeze

  validates :title, :text, :rating, presence: true
  validates :title, length: { maximum: TITLE_MAX_LENGTH }
  validates :text, length: { maximum: TEXT_MAX_LENGTH }
  validates :rating, numericality: { only_integer: true,
                                     greater_than_or_equal_to: MIN_RATING,
                                     less_than_or_equal_to: MAX_RATING }
end
