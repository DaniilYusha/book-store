class ReviewForm
  include ActiveModel::Model

  attr_accessor :title, :text, :rating, :book_id, :user_id

  TITLE_MAX_LENGTH = 80
  TEXT_MAX_LENGTH = 500
  RATING_RANGE = (1..5).freeze

  validates :title, :text, :rating, presence: true
  validates :title, length: { maximum: TITLE_MAX_LENGTH }
  validates :text, length: { maximum: TEXT_MAX_LENGTH }
  validates :rating, numericality: { only_integer: true,
                                     greater_than_or_equal_to: RATING_RANGE.first,
                                     less_than_or_equal_to: RATING_RANGE.last }

  def initialize(params = {})
    super(params)
  end
end
