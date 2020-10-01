module Sections
  class BooksList < SitePrism::Section
    elements :books, 'div.row div'
    element :view_more_button, 'button.view-more'
  end
end
