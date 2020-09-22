class BookDecorator < ApplicationDecorator
  SHORT_DESCRIPTION_LENGTH = 50

  delegate_all

  def authors
    object.authors.map(&:name).join ', '
  end

  def published_at
    object.published_at.year
  end

  def materials
    object.materials.map(&:name).join(', ').capitalize
  end

  def dimension
    [
      object.dimension.height.to_s.insert(0, 'H:'),
      object.dimension.width.to_s.insert(0, 'W:'),
      object.dimension.depth.to_s.insert(0, 'D:')
    ].join '" x '
  end

  def short_description
    object.description.truncate SHORT_DESCRIPTION_LENGTH
  end
end
