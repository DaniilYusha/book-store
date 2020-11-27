module Sections
  module Settings
    class SettingsList < SitePrism::Section
      element :address_link, 'li > a[href="#address"]'
      element :privacy_link, 'li > a[href="#privacy"]'
    end
  end
end
