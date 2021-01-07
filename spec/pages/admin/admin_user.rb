module Pages
  module Admin
    class AdminUser < SitePrism::Page
      set_url('admin/admin_users/{id}')

      section :admin_details, Sections::Admin::AdminDetails, '#main_content'
    end
  end
end
