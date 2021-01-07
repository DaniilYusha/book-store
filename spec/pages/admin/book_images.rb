module Pages
  module Admin
    class BookImages < SitePrism::Page
      set_url('admin/book_images')

      section :main_content, Sections::Admin::BookImage::List, '#index_table_book_images'
    end
  end
end
