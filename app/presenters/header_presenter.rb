class HeaderPresenter
  def initialize(cart:)
    @cart = cart
  end

  def books_in_cart
    cart ? cart.items_count : 0
  end

  def categories
    Category.all
  end

  private

  attr_reader :cart
end
