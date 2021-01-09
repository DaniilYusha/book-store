module Pages
  module Admin
    class EditAdminUser < SitePrism::Page
      set_url('admin/admin_users/{id}/edit')

      section :fields, Sections::Admin::AdminUserFields, '#main_content'
    end
  end
end
