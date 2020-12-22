class AuthorForm
  include ActiveModel::Model
  include Virtus.model

  attribute :first_name, String
  attribute :last_name, String

  NAME_MAX_LENGTH = 50

  validates :first_name, :last_name, presence: true, length: { maximum: NAME_MAX_LENGTH }
end
