class Author < ApplicationRecord
  has_many :author_book, dependent: :destroy
  has_many :books, through: :author_book, dependent: :destroy
end
