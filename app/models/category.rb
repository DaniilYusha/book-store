class Category < ApplicationRecord
  NAMES_FORMAT_PATTERN = /\A[a-zA-z\s]+\z/.freeze

  has_many :books, dependent: :destroy

  validates :name, presence: true, uniqueness: true, format: { with: NAMES_FORMAT_PATTERN }

  scope :with_books, -> { includes [:books] }
end
