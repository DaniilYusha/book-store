class SortedBooksQuery
  attr_reader :relation, :sort_by, :category_id, :limit

  SORT_OPTIONS = {
    newest_desc: ->(relation) { relation.order('created_at desc') },
    popular_asc: ->(relation) { relation.order('created_at asc') },
    title_asc: ->(relation) { relation.order('title asc') },
    title_desc: ->(relation) { relation.order('title desc') },
    price_asc: ->(relation) { relation.order('price asc') },
    price_desc: ->(relation) { relation.order('price desc') }
  }.freeze

  def self.call(relation: Book.all, sort_by: nil, category_id: nil, limit: nil)
    new(relation: relation, sort_by: sort_by, category_id: category_id, limit: limit).call
  end

  def initialize(relation: Book.all, sort_by: nil, category_id: nil, limit: nil)
    @relation = relation
    @sort_by = sort_by&.to_sym || :title_asc
    @category_id = category_id
    @limit = limit || Book::BOOKS_PER_PAGE
  end

  def call
    SORT_OPTIONS[sort_by].call(scope)
  end

  private

  def scope
    return relation.includes(:authors).limit(limit) unless category_id

    relation.includes(:authors).where(category_id: category_id).limit(limit)
  end
end
