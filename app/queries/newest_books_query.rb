class NewestBooksQuery
  NEWEST_BOOKS_COUNT = 3

  def self.call
    new.call
  end

  def call
    BookDecorator.decorate_collection(Book.includes(:authors).last(NEWEST_BOOKS_COUNT))
  end
end
