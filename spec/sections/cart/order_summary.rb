module Sections
  module Cart
    class OrderSummary < SitePrism::Section
      element :coupon_code_field, '#coupon_code'
      element :apply_coupon_button, 'form.coupon > input[type="submit"]'
      element :summary_block, '.general-summary-table'

      def enter_coupon(code)
        coupon_code_field.set(code)
        apply_coupon_button.click
      end
    end
  end
end
