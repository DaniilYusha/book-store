class BookDecorator < ApplicationDecorator
  include ActionView::Helpers::AssetTagHelper
  delegate_all
  decorates_association :authors

  NEWEST_BOOKS_COUNT = 3
  SHORT_DESCRIPTION_LENGTH = 250

  def authors_list
    object.authors.map { |author| author.decorate.full_name }.join(', ')
  end

  def materials_list
    object.materials.split.join(', ').capitalize
  end

  def dimensions
    "H:#{object.height}\" x W:#{object.width}\" x D:#{object.depth}"
  end

  def short_description
    object.description.truncate(SHORT_DESCRIPTION_LENGTH)
  end

  def image(size = :w170)
    image_tag(object.title_image_url(size).to_s)
  end
end
