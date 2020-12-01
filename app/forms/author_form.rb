class AuthorForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name

  NAME_MAX_LENGTH = 50

  validates :first_name, :last_name, presence: true, length: { maximum: NAME_MAX_LENGTH }
end
