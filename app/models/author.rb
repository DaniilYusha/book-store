class Author < ApplicationRecord
  NAME_MAX_LENGTH = 50
  NAMES_FORMAT_PATTERN = /\A[a-zA-z.']+\z/.freeze

  has_many :author_books, dependent: :destroy
  has_many :books, through: :author_books, dependent: :destroy

  validates :first_name, :last_name, presence: true,
                                     length: { maximum: NAME_MAX_LENGTH },
                                     format: { with: NAMES_FORMAT_PATTERN }
end
