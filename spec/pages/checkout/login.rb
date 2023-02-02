module Pages
  module Checkout
    class Login < SitePrism::Page
      set_url '/checkout/login'

      section :returning_customer, Sections::Checkout::Login::ReturningCustomer, '.col-md-5.mb-40'
      section :new_customer, Sections::Checkout::Login::NewCustomer, '.col-md-5.mb-60'
    end
  end
end
