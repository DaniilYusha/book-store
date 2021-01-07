module Pages
  module Admin
    class EditAuthor < SitePrism::Page
      set_url('admin/authors/{id}/edit')

      section :fields, Sections::Admin::Author::CreateForm, '#main_content'
    end
  end
end
