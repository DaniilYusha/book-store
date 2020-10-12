module Pages
  class SignUp < SitePrism::Page
    set_url '/users/sign_up'

    section :auth_form_header, Sections::AuthFormHeader, '.container>div.text-center'
    section :sign_up_form, Sections::SignUpForm, '.general-form'
    sections :links, Sections::SignUpLinks, '.general-sign-text'
  end
end
