class Author < ApplicationRecord
  NAME_MAX_LENGTH = 100

  has_many :author_book
  has_many :books, through: :author_book

  validates :name, presence: true, length: { maximum: NAME_MAX_LENGTH }
end
