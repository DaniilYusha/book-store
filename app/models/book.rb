class Book < ApplicationRecord
  BOOKS_PER_PAGE = 12

  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_one_attached :title_image
  has_many_attached :images

  belongs_to :category
end
