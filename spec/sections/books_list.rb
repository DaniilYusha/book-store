module Sections
  class BooksList < SitePrism::Section
    elements :books, '.book'
  end
end
