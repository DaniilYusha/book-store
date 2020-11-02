class BookDecorator < ApplicationDecorator
  SHORT_DESCRIPTION_LENGTH = 250

  delegate_all

  def authors_list
    object.authors.map { |author| author.first_name.concat(' ', author.last_name) }.join ', '
  end

  def published_at
    object.published_at.year
  end

  def materials_list
    object.materials.map(&:name).join(', ').capitalize
  end

  def dimensions
    "H:#{object.height}\" x W:#{object.width}\" x D:#{object.depth}"
  end

  def short_description
    object.description.truncate SHORT_DESCRIPTION_LENGTH
  end
end
