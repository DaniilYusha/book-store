module Pages
  module Orders
    class Index < SitePrism::Page
      set_url '/orders'

      section :orders, Sections::Cart::Orders, '.hidden-xs > table.table'
      section :order_summary, Sections::Cart::OrderSummary, '.general-order-wrap'
    end
  end
end
