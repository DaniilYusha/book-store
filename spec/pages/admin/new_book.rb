module Pages
  module Admin
    class NewBook < SitePrism::Page
      set_url 'admin/books/new'

      section :fields, Sections::Admin::Book::CreateForm, '#main_content'
    end
  end
end
