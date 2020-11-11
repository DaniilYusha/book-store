class Book < ApplicationRecord
  BOOKS_PER_PAGE = 12

  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books, dependent: :destroy
  has_many :book_material

  belongs_to :category
end
