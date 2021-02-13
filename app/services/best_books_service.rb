class BestBooksService
  BEST_BOOKS_COUNT = 4

  def self.call
    new.call
  end

  def call
    Book.includes(:authors).where(id: books_ids)
  end

  private

  def books_ids
    books_ids_with_count.map(&:first)
  end

  def books_ids_with_count
    Book.joins(:order_items).group(:id).count.sort_by { |_key, value| -value }.first(BEST_BOOKS_COUNT)
  end
end
