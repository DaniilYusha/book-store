module Sections
  class Footer < SitePrism::Section
    element :home_link, 'ul.list-inline>li>a.home_link'
    element :shop_link, 'ul.list-inline>li>a.shop_link'
    element :orders_link, 'ul.list-inline>li>a.orders_link'
    element :settings_link, 'ul.list-inline>li>a.settings_link'

    element :email, 'p.general-nav-mail'
    element :phone, 'p.general-nav-number'

    element :facebook_link, 'a.facebook-link'
    element :twitter_link, 'a.twitter-link'
    element :google_link, 'a.google-link'
    element :instagram_link, 'a.instagram-link'
  end
end
