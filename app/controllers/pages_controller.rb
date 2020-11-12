class PagesController < ApplicationController
  def home
    @newest_books = BookDecorator.decorate_collection(
      Book.includes(:authors, :title_image_attachment).last(BookDecorator::NEWEST_BOOKS_COUNT)
    )
  end
end
