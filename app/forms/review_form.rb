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
  RATING_RANGE = (1..5).freeze

  validates :title, :text, :rating, presence: true
  validates :title, length: { maximum: TITLE_MAX_LENGTH }
  validates :text, length: { maximum: TEXT_MAX_LENGTH }
  validates :rating, numericality: { only_integer: true,
                                     greater_than_or_equal_to: RATING_RANGE.first,
                                     less_than_or_equal_to: RATING_RANGE.last }
end
