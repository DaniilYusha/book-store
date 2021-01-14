module Sections
  module Admin
    module Coupon
      class List < SitePrism::Section
        element :id_column, '.col-id'
        element :code_column, '.col-code'
        element :discount_column, '.col-discount'
      end
    end
  end
end
