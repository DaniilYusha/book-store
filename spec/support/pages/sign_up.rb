module Pages
  class SignUp < SitePrism::Page
    set_url '/sign_up'

    section :auth_form_header, Sections::AuthFormHeader, '.container>div.text-center'
    section :sign_up_form, Sections::SignUpForm, '.general-form'
    sections :links, Sections::SignUpLinks, '.general-sign-text'

    # def form_links
    #   links.map { |link| link.title['href'] }
    # end
  end
end
