class BooksController < ApplicationController
  def index
    @books = SortedBooksQuery.new(
      category_id: book_params[:category_id],
      sort_by: book_params[:sort_by], limit: book_params[:limit]
    ).call.decorate
    @books_count = Book.count
  end

  def show
    @book = Book.includes(:authors).find_by(id: book_params[:id]).decorate
  end

  private

  def book_params
    params.permit(:id, :category_id, :sort_by, :limit)
  end
end
