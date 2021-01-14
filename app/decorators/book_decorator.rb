class BookDecorator < ApplicationDecorator
  NEWEST_BOOKS_COUNT = 3
  SHORT_DESCRIPTION_LENGTH = 250

  delegate_all
  decorates_association :authors

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
end
