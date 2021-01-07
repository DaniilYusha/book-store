module Pages
  module Admin
    class LogIn < SitePrism::Page
      set_url('admin/login')

      section :form, Sections::Admin::LogInForm, '#login'
    end
  end
end
