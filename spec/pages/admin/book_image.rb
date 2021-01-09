module Pages
  module Admin
    class BookImage < SitePrism::Page
      set_url('admin/book_images/{id}')

      section :details, Sections::Admin::BookImage::Details, '#main_content'
    end
  end
end
