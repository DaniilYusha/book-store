class PagesController < ApplicationController
  def home
    @newest_books = BookDecorator.decorate_collection(
      Book.last(BookDecorator::NEWEST_BOOKS_COUNT)
    )
  end
end
