module Pages
  class Catalog < SitePrism::Page
    set_url '/books'

    section :sorting, Sections::Sorting, '.container > div.clearfix'
    section :books_list, Sections::BooksList, '.container > div.books-list'
  end
end
