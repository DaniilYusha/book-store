require 'pagy/extras/array'

Pagy::VARS[:items] = BooksController::BOOKS_NUMBER_PER_PAGE
