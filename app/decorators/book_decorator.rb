class BookDecorator < ApplicationDecorator
  SHORT_DESCRIPTION_LENGTH = 250

  delegate_all
  decorates_association :reviews

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
    [
      object.height.to_s.insert(0, 'H:'),
      object.width.to_s.insert(0, 'W:'),
      object.depth.to_s.insert(0, 'D:')
    ].join '" x '
  end

  def short_description
    object.description.truncate SHORT_DESCRIPTION_LENGTH
  end
end
