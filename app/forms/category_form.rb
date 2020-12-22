class CategoryForm
  include ActiveModel::Model
  include Virtus.model

  attribute :name

  NAME_MAX_LENGTH = 50

  validates :name, presence: true, length: { maximum: NAME_MAX_LENGTH }
end