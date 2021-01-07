module Pages
  module Admin
    class NewAdminUser < SitePrism::Page
      set_url('admin/admin_users/new')

      section :fields, Sections::Admin::AdminUserFields, '#main_content'
    end
  end
end
