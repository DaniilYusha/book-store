module Pages
  module Admin
    class EditCoupon < SitePrism::Page
      set_url('admin/coupons/{id}/edit')

      section :fields, Sections::Admin::Coupon::CreateForm, '#main_content'
    end
  end
end
