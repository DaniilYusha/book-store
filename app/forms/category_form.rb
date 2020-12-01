class CategoryForm
  include ActiveModel::Model

  attr_accessor :name

  NAME_MAX_LENGTH = 50

  validates :name, presence: true, length: { maximum: NAME_MAX_LENGTH }
  validate :name_uniqueness

  private

  def name_uniqueness
    errors.add(:name, I18n.t('alert.name.unique')) if Category.where(name: name).exists?
  end
end
