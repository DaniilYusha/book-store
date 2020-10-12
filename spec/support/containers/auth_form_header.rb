module Sections
  class AuthFormHeader < SitePrism::Section
    element :page_name, '.general-login-title'
    element :facebook_icon, '.general-login-icon'
  end
end
