class Book < ApplicationRecord
  TITLE_MAX_LENGTH = 100
  MIN_PRICE = 0
  MAX_PRICE = 1_000_000

  has_many :author_book, dependent: :destroy
  has_many :authors, through: :author_book
  has_many :book_material, dependent: :destroy
  has_many :materials, through: :book_material
  has_many :reviews, dependent: :destroy

  belongs_to :category

  validates :title, presence: true, uniqueness: true, length: { maximum: TITLE_MAX_LENGTH }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: MIN_PRICE,
                                    less_than_or_equal_to: MAX_PRICE }
  validates :published_at, presence: true

  scope :with_authors, -> { includes [:authors] }
end
