class HeaderPresenter
  def initialize(order:)
    @order = order
  end

  def books_in_order
    order ? order.items_count : 0
  end

  def categories
    Category.all
  end

  private

  attr_reader :order
end
