class Author < ApplicationRecord
  NAME_MAX_LENGTH = 30

  has_many :author_book
  has_many :books, through: :author_book

  validates :first_name, :last_name, presence: true,
                                     length: { maximum: NAME_MAX_LENGTH }
end
