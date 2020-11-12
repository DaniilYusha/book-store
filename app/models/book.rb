class Book < ApplicationRecord
  BOOKS_PER_PAGE = 12
  TITLE_MAX_LENGTH = 100
  MIN_PRICE = 0
  MAX_PRICE = 1_000_000

  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books, dependent: :destroy
  has_many :reviews, dependent: :destroy

  belongs_to :category

  validates :title, presence: true, uniqueness: true, length: { maximum: TITLE_MAX_LENGTH }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: MIN_PRICE,
                                    less_than_or_equal_to: MAX_PRICE }
  validates :published_at, presence: true
end
