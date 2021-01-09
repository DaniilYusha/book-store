module Pages
  module Admin
    class Review < SitePrism::Page
      set_url 'admin/reviews/{id}'

      section :review_details, Sections::Admin::Review::Details, '#main_content'
      section :actions, Sections::Admin::Review::Actions, '#titlebar_right'
    end
  end
end
