class BooksController < ApplicationController

  def index
    @pagy, @books = pagy_array(SortedBooksQuery.new(@categories, book_params).all.decorate)
    @books_count = Book.count
    @current_category = params[:category_id]
  end

  def show
    @book = Book.includes(:authors).find(book_params[:id]).decorate
  end

  private

  def book_params
    params.permit(:id)
  end
end
