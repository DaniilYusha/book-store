module Pages
  module Admin
    module BookImages
      class New < SitePrism::Page
        set_url('admin/book_images/new')

        section :fields, Sections::Admin::BookImage::CreateForm, '#main_content'
      end
    end
  end
end
