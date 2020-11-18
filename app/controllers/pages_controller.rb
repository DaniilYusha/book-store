class PagesController < ApplicationController
  def home
    @newest_books = BookDecorator.decorate_collection(
      Book.includes(:authors, title_image_attachment: :blob).last(BookDecorator::NEWEST_BOOKS_COUNT)
    )
  end

  def checkout_login
    redirect_to checkout_index_path if current_user.present?
  end
end
