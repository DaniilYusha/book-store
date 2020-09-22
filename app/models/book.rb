class Book < ApplicationRecord
  TITLE_MAX_LENGTH = 100

  has_many :author_book, dependent: :destroy
  has_many :authors, through: :author_book, dependent: :destroy
  has_many :book_material
  has_many :materials, through: :book_material

  belongs_to :category

  validates :title, presence: true, uniqueness: true, length: { maximum: TITLE_MAX_LENGTH }
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
  validates :published_at, presence: true
end
