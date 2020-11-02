class PagesController < ApplicationController
  LAST_BOOKS_COUNT = 3

  def home
    @newest_books = BookDecorator.decorate_collection Book.includes(:authors).last(LAST_BOOKS_COUNT)
  end
end
