module Pages
  module Admin
    class Book < SitePrism::Page
      set_url('admin/books/{id}')

      section :book_details, Sections::Admin::Book::Details, '#main_content'
    end
  end
end
