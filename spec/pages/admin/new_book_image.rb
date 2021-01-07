module Pages
  module Admin
    class NewBookImage < SitePrism::Page
      set_url('admin/book_images/new')

      section :fields, Sections::Admin::BookImage::CreateForm, '#main_content'
    end
  end
end
