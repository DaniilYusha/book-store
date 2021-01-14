module Pages
  module Admin
    class EditBookImage < SitePrism::Page
      set_url('admin/book_images/{id}/edit')

      section :fields, Sections::Admin::BookImage::CreateForm, '#main_content'
    end
  end
end
