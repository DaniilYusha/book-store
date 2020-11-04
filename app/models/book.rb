class Book < ApplicationRecord
  BOOKS_PER_PAGE = 12

  has_many :author_book, dependent: :destroy
  has_many :authors, through: :author_book, dependent: :destroy
  has_many :book_material
  has_many :materials, through: :book_material

  belongs_to :category
end
