module Pages
  module Admin
    class Coupons < SitePrism::Page
      set_url('admin/coupons')

      section :main_content, Sections::Admin::Coupon::List, '#index_table_coupons'
    end
  end
end
