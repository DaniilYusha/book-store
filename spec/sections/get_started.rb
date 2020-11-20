module Sections
  class GetStarted < SitePrism::Section
    element :get_started_link, 'a.btn-default'
    element :greeting, 'h2.h1'
    element :introduction, 'div.mb-res-50>p'

    def click_get_started_link
      get_started_link.click
    end
  end
end
