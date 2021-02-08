class HeaderPresenter
  DEFAULT_BOOKS_COUNT = 0

  def initialize(order:)
    @order = order
  end

  def books_in_order
    order ? order.items_count : DEFAULT_BOOKS_COUNT
  end

  def categories
    Category.all
  end

  private

  attr_reader :order
end
