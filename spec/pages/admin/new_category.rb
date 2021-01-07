module Pages
  module Admin
    class NewCategory < SitePrism::Page
      set_url('admin/categories/new')

      section :fields, Sections::Admin::Category::CreateForm, '#main_content'
    end
  end
end
