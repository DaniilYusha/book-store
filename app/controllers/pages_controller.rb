class PagesController < ApplicationController
  def home
    @newest_books = BookDecorator.decorate_collection(
      Book.includes(:authors).last(BookDecorator::NEWEST_BOOKS_COUNT)
    )
    @best_sellers = BestBooksService.call.decorate
  end
end
