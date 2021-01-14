module Sections
  module Admin
    module Coupon
      class CreateForm < SitePrism::Section
        element :code_input, '#coupon_code'
        element :discount_input, '#coupon_discount'
        element :create_button, '#coupon_submit_action > input'
        element :cancel_button, '.cancel'

        def submit(params)
          code_input.set(params[:code])
          discount_input.set(params[:discount])
          create_button.click
        end
      end
    end
  end
end
