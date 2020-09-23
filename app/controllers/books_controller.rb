class BooksController < ApplicationController
  BOOKS_PER_PAGE_NUMBER = 12

  def index
    @pagy, books = pagy(Book.includes(:authors).all.order(title: :asc), items: BOOKS_PER_PAGE_NUMBER)
    @books = BookDecorator.decorate_collection books
    @categories = Category.includes(:books).all
  end

  def show
    @book = Book.includes(:authors).find(params[:id]).decorate
  end
end
