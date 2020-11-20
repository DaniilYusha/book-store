module Sections
  class BookDescription < SitePrism::Section
    element :book_title, 'div > h1.mt-res-0'
    element :book_authors, 'div.col-sm-6 > p.lead.small'
    element :book_price, 'p.h1.in-gold-500'
    element :add_to_cart_button, 'button.btn-default.pull-right'
    element :book_description, 'div.general-info-wrap > p.lead.small'
    element :publication_year, '.publication_year'
    element :dimensions, '.dimensions'
    element :materials, '.materials'
  end
end
