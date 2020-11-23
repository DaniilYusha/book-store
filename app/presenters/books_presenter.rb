class BooksPresenter
  def initialize(current_books_count)
    @current_books_count = current_books_count
  end

  def books_count
    Book.count
  end

  def calculate_limit
    current_books_count.nil? ? 12 : current_books_count.to_i + 12
  end

  private

  attr_reader :current_books_count
end