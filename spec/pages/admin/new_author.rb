module Pages
  module Admin
    class NewAuthor < SitePrism::Page
      set_url 'admin/authors/new'

      section :fields, Sections::Admin::Author::CreateForm, '#main_content'
    end
  end
end
