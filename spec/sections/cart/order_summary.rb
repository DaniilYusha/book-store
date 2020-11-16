module Sections
  module Cart
    class OrderSummary < SitePrism::Section
      element :coupon_code_field, '#coupon_code'
      element :apply_coupon_button, 'form.coupon > .btn'
      element :summary_block, '.general-summary-table'
    end
  end
end
