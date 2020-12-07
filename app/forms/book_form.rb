class BookForm
  include ActiveModel::Model

  attr_accessor :title, :description, :price, :published_at, :height,
                :width, :depth, :materials, :category_id, :author_ids,
                :title_image, :images

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
