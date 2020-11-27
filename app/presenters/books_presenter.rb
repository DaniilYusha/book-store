class BooksPresenter
  def initialize(current_books_count = nil)
    @current_books_count = current_books_count
  end

  def books_count
    Book.count
  end

  def calculate_limit
    current_books_count.nil? ? Book::BOOKS_PER_PAGE : current_books_count.to_i + Book::BOOKS_PER_PAGE
  end

  private

  attr_reader :current_books_count
end
