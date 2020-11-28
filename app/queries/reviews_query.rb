class ReviewsQuery
  SORT_OPTIONS = {
    created_at_desc: ->(relation) { relation.order('created_at desc') }
  }.freeze

  def initialize(book_id:, relation: Review.all, sort_by: :created_at_desc)
    @relation = relation
    @sort_by = sort_by
    @book_id = book_id
  end

  def call
    SORT_OPTIONS[sort_by].call(scope)
  end

  private

  attr_reader :relation, :sort_by, :book_id

  def scope
    relation.includes(:user).where(['status = ? and book_id = ?', 1, book_id])
  end
end
