class BookForm
  include ActiveModel::Model

  attr_accessor :title, :description, :price, :published_at, :height,
                :width, :depth, :materials, :category_id, :author_ids

  TITLE_MAX_LENGTH = 100
  DESCRIPTION_MAX_LENGTH = 500

  validates :category_id, :title, :description, :price, :published_at,
            :height, :width, :depth, :materials, presence: true
  validates :title, length: { maximum: TITLE_MAX_LENGTH }
  validates :description, length: { maximum: DESCRIPTION_MAX_LENGTH }
  validates :price, :height, :width, :depth, numericality: { greater_than: 0 }
end
