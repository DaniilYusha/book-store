class BookDecorator < ApplicationDecorator
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
end
