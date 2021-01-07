module Pages
  module Admin
    class AdminUsers < SitePrism::Page
      set_url('admin/admin_users')

      section :main_content, Sections::Admin::AdminUsersList, '#index_table_admin_users'
    end
  end
end
