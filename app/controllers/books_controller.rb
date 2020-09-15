class BooksController < ApplicationController
  def index
    @books = BookDecorator.decorate_collection Book.includes(:authors).all.order(title: :asc)
  end

  def show
    @book = Book.includes(:authors).find(params[:id]).decorate
  end
end
