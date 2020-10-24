module Pages
  class Home < SitePrism::Page
    set_url '/'

    section :footer, Sections::Footer, 'footer'
    section :get_started, Sections::GetStarted, 'div.jumbotron'
    section :header, Sections::Header, 'header'
    section :slider, Sections::Slider, '#slider'

    def click_header_home_link
      header.home_link.click
    end

    def click_footer_home_link
      header.home_link.click
    end
  end
end
