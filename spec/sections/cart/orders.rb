module Sections
  module Cart
    class Orders < SitePrism::Section
      elements :books_images, '.general-img-wrap-table'
      elements :books_titles, 'a.title'
      elements :books_price, 'span.price'
      elements :quantity_inputs, '.quantity-controller > input'
      elements :minus_links, '#minus'
      elements :plus_links, '#plus'
      elements :sub_total_price, '.sub-total'
      elements :remove_items_links, '.close.general-cart-close'
    end
  end
end
