module Pages
  module Admin
    class Authors < SitePrism::Page
      set_url 'admin/authors'

      section :main_content, Sections::Admin::Author::List, '#index_table_authors'
    end
  end
end
