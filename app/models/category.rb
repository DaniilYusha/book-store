class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :with_books, -> { includes [:books] }
end
