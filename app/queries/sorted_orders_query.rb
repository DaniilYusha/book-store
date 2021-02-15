class SortedOrdersQuery
  SORT_OPTIONS = {
    all: ->(relation) { relation.where('status > ?', Order.statuses[:confirm]) },
    complete: ->(relation) { relation.complete },
    in_delivery: ->(relation) { relation.in_delivery },
    delivered: ->(relation) { relation.delivered },
    canceled: ->(relation) { relation.canceled }
  }.freeze

  def initialize(relation:, sort_by: nil)
    @relation = relation
    @sort_by = sort_by&.to_sym || :all
  end

  def call
    SORT_OPTIONS[sort_by].call(scope)
  end

  private

  attr_reader :relation, :sort_by

  def scope
    relation.includes([:coupon, :delivery, { order_items: [:book] }])
  end
end
