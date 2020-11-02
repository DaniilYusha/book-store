module Pages
  module Admin
    class Books < SitePrism::Page
      set_url 'admin/books'

      section :main_content, Sections::Admin::Book::List, '#index_table_books'
      section :filters, Sections::Admin::Book::Filters, '#filters_sidebar_section'
    end
  end
end
