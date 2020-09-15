class HomeController < ApplicationController
  LAST_ADDED_BOOKS_COUNT = 3

  def index
    @latest_books = BookDecorator.decorate_collection Book.includes(:authors).last(LAST_ADDED_BOOKS_COUNT)
  end
end