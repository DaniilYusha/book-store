class CategoryForm
  include ActiveModel::Model

  attr_accessor :name

  NAME_MAX_LENGTH = 50

  validates :name, presence: true, length: { maximum: NAME_MAX_LENGTH }
end
