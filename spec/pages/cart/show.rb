module Pages
  module Cart
    class Show < SitePrism::Page
      set_url '/cart'

      section :orders, Sections::Cart::Orders, '.hidden-xs > table.table'
      section :order_summary, Sections::Cart::OrderSummary, '.general-order-wrap'
    end
  end
end
