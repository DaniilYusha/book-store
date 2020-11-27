class SortedBooksQuery
  SORT_OPTIONS = {
    newest_desc: ->(relation) { relation.order('created_at desc') },
    popular_asc: ->(relation) { relation.order('created_at asc') },
    title_asc: ->(relation) { relation.order('title asc') },
    title_desc: ->(relation) { relation.order('title desc') },
    price_asc: ->(relation) { relation.order('price asc') },
    price_desc: ->(relation) { relation.order('price desc') }
  }.freeze

  def initialize(relation: Book.all, sort_by: nil, category_id: nil)
    @relation = relation
    @sort_by = sort_by&.to_sym || :title_asc
    @category_id = category_id
  end

  def call
    SORT_OPTIONS[@sort_by].call(scope)
  end

  private

  attr_reader :relation, :sort_by, :category_id

  def scope
    return relation.includes(:authors) unless category_id

    relation.includes(:authors).where(category_id: category_id)
  end
end
