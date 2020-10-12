module Pages
  class ForgotPassword < SitePrism::Page
    set_url '/users/password/new'

    section :auth_form_header, Sections::AuthFormHeader, '.container>div.text-center'
    section :forgot_password_form, Sections::ForgotPasswordForm, '.general-form'
  end
end
