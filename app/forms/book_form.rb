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
  attribute :author_ids, Array[String]

  TITLE_MAX_LENGTH = 100
  DESCRIPTION_MAX_LENGTH = 500

  validates :category_id, :title, :description, :price, :published_at,
            :height, :width, :depth, :materials, presence: true
  validates :title, length: { maximum: TITLE_MAX_LENGTH }
  validates :description, length: { maximum: DESCRIPTION_MAX_LENGTH }
  validates :price, :height, :width, :depth, numericality: { greater_than: 0 }
end
