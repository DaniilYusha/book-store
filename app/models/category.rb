class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  scope :with_books, -> { includes [:books] }
end
