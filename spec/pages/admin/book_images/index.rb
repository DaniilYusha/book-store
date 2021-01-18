module Pages
  module Admin
    module BookImages
      class Index < SitePrism::Page
        set_url('admin/book_images')

        section :main_content, Sections::Admin::BookImage::List, '#index_table_book_images'
      end
    end
  end
end
