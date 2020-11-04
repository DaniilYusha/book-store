class Book < ApplicationRecord
  BOOKS_PER_PAGE = 12
  TITLE_MAX_LENGTH = 100
  MIN_PRICE = 0
  MAX_PRICE = 1_000_000

  has_many :author_book, dependent: :destroy
  has_many :authors, through: :author_book, dependent: :destroy
  has_many :book_material
  has_many :materials, through: :book_material

  belongs_to :category
end
