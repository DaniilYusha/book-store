module Pages
  class Settings < SitePrism::Page
    set_url '/users/edit'

    section :settings_list, Sections::Settings::SettingsList, 'ul.nav[role="tablist"]'
    section :billing_address_form, Sections::Settings::AddressForm, '#billing-address-form'
    section :shipping_address_form, Sections::Settings::AddressForm, '#shipping-address-form'
    section :email_form, Sections::Settings::EmailForm, '#privacy > .row > div.col-sm-5:first-of-type'
    section :password_form, Sections::Settings::PasswordForm, '#privacy > .row > div:nth-child(2)'
    section :remove_account, Sections::Settings::RemoveAccount, '#privacy > .row > div:last-child'
  end
end
