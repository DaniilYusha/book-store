class PagesController < ApplicationController
  def home
    @newest_books = NewestBooksQuery.call
  end
end
