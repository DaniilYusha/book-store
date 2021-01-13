module Sections
  module Cart
    class Orders < SitePrism::Section
      element :book_image, '.general-img-wrap-table > a > img'
      element :book_title, 'a.title'
      element :book_price, 'span.price'
      element :quantity_input, '.quantity-controller > input'
      element :minus_link, '#minus'
      element :plus_link, '#plus'
      element :sub_total_price, '.sub-total'
      element :remove_items_link, '.close.general-cart-close'
    end
  end
end
