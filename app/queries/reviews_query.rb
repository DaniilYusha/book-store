class ReviewsQuery
  attr_reader :relation, :sort_by

  SORT_OPTIONS = {
    created_at_desc: ->(relation) { relation.order('created_at desc') }
  }.freeze

  def self.call(relation, sort_by: :created_at_desc)
    new(relation, sort_by: sort_by).call
  end

  def initialize(relation, sort_by: :created_at_desc)
    @relation = relation
    @sort_by = sort_by
  end

  def call
    SORT_OPTIONS[sort_by].call(scope)
  end

  private

  def scope
    relation.reviews.where('status = 1')
  end
end
