module Pages
  module Admin
    class EditBook < SitePrism::Page
      set_url('admin/books/{id}/edit')

      section :fields, Sections::Admin::Book::CreateForm, '#main_content'
    end
  end
end
