class Author < ApplicationRecord
  NAME_MAX_LENGTH = 30
  NAMES_FORMAT_PATTERN = /[a-zA-z]/.freeze

  has_many :author_book, dependent: :destroy
  has_many :books, through: :author_book, dependent: :destroy
end
