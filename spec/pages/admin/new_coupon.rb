module Pages
  module Admin
    class NewCoupon < SitePrism::Page
      set_url('admin/coupons/new')

      section :fields, Sections::Admin::Coupon::CreateForm, '#main_content'
    end
  end
end
