class Material < ApplicationRecord
  has_many :book_material
  has_many :books, through: :book_material
end
