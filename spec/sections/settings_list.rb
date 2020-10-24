module Sections
  class SettingsList < SitePrism::Section
    element :address_link, 'li > a[href="#address"]'
    element :privacy_link, 'li > a[href="#privacy"]'

    def move_to_privacy
      privacy_link.click
    end
  end
end
