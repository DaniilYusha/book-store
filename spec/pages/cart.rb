module Pages
  class Cart < SitePrism::Page
    set_url '/carts'

    section :orders, Sections::Cart::Orders, '.hidden-xs > table.table'
    section :order_summary, Sections::Cart::OrderSummary, '.general-order-wrap'
  end
end
