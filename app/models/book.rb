class Book < ApplicationRecord
  BOOKS_PER_PAGE = 12

  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books, dependent: :destroy
  accepts_nested_attributes_for :authors
  belongs_to :category

  validates :title, :description, :price, :published_at, :height, :width, :depth, :materials, presence: true
end
