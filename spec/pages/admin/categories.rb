module Pages
  module Admin
    class Categories < SitePrism::Page
      set_url 'admin/categories'

      section :main_content, Sections::Admin::Category::List, '#index_table_categories'
    end
  end
end
