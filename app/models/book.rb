class Book < ApplicationRecord
  TITLE_MAX_LENGTH = 100

  has_many :author_book
  has_many :authors, through: :author_book

  validates :title, presence: true, length: { maximum: TITLE_MAX_LENGTH }
end
