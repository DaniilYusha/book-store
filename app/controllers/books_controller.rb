class BooksController < ApplicationController
  BOOKS_NUMBER_PER_PAGE = 12

  def index
    @pagy, @books = pagy_array(SortedBooksQuery.new(@categories, params).all.decorate)
    @books_count = Book.count
    @current_category = params[:category_id]
  end

  def show
    @book = Book.includes(:authors).find(params[:id]).decorate
  end
end
