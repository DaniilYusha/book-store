class BookDecorator < ApplicationDecorator
  NEWEST_BOOKS_COUNT = 3
  SHORT_DESCRIPTION_LENGTH = 250
  CURRENCY = '€'.freeze

  delegate_all
  decorates_association :authors
  decorates_association :reviews

  def authors_list
    object.authors.map { |author| author.decorate.name }.join(', ')
  end

  def price_with_currency
    CURRENCY + object.price.to_s
  end

  def materials_list
    object.materials.sub(' ', ', ').capitalize
  end

  def dimensions
    "H:#{object.height}\" x W:#{object.width}\" x D:#{object.depth}"
  end

  def short_description
    object.description.truncate(SHORT_DESCRIPTION_LENGTH)
  end
end
