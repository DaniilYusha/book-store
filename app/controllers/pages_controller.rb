class PagesController < ApplicationController
  LAST_ADDED_BOOKS_COUNT = 3

  def home
    @latest_books = BookDecorator.decorate_collection Book.includes(:authors).last(LAST_ADDED_BOOKS_COUNT)
    
    render 'pages/home/index'
  end
end
