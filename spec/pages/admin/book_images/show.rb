module Pages
  module Admin
    module BookImages
      class Show < SitePrism::Page
        set_url('admin/book_images/{id}')

        section :details, Sections::Admin::BookImage::Details, '#main_content'
      end
    end
  end
end
