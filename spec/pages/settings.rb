module Pages
  class Settings < SitePrism::Page
    set_url '/users/edit'

    section :settings_list, Sections::SettingsList, 'ul.nav[role="tablist"]'
    section :billing_address_form, Sections::BillingAddressForm, '#address > .row > div:first-child'
    section :shipping_address_form, Sections::ShippingAddressForm, '#address > .row > div:last-child'
    section :email_form, Sections::EmailForm, '#privacy > .row > div.col-sm-5:first-of-type'
    section :password_form, Sections::PasswordForm, '#privacy > .row > div:nth-child(2)'
    section :remove_account, Sections::RemoveAccount, '#privacy > .row > div:last-child'
  end
end
