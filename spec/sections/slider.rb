module Sections
  class Slider < SitePrism::Section
    elements :buy_now_buttons, 'div.general-align>a.btn-primary'

    def buy_first_book
      buy_now_buttons.first.click
    end
  end
end
