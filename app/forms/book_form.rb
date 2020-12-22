class BookForm
  include ActiveModel::Model
  include Virtus.model

  attribute :title, String
  attribute :description, String
  attribute :price, Float
  attribute :published_at, DateTime
  attribute :height, Float
  attribute :width, Float
  attribute :depth, Float
  attribute :materials, String
  attribute :category_id, Integer
  attribute :author_ids, Array[Integer]

  TITLE_MAX_LENGTH = 100
  DESCRIPTION_MAX_LENGTH = 500

  validate :authors_presence
  validates :category_id, :title, :description, :price, :published_at,
            :height, :width, :depth, :materials, presence: true
  validates :title, length: { maximum: TITLE_MAX_LENGTH }
  validates :description, length: { maximum: DESCRIPTION_MAX_LENGTH }
  validates :price, :height, :width, :depth, numericality: { greater_than: 0 }

  private

  def authors_presence
    errors.add(:authors, I18n.t('alert.blank')) if author_ids.blank? || author_ids_empty?
  end

  def author_ids_empty?
    author_ids.first.empty? && author_ids.size == 1
  end
end
