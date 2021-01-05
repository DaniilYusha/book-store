module Pages
  module Admin
    class EditCategory < SitePrism::Page
      set_url('admin/categories/{id}/edit')

      section :fields, Sections::Admin::Category::CreateForm, '#main_content'
    end
  end
end
