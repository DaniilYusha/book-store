module Pages
  class SignIn < SitePrism::Page
    set_url '/users/sign_in'

    section :auth_form_header, Sections::AuthFormHeader, '.container>div.text-center'
    section :sign_in_form, Sections::SignInForm, '.general-form'
    sections :links, Sections::SignInLinks, '.general-sign-text'
  end
end
