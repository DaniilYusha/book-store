module Pages
  class Home < SitePrism::Page
    set_url '/'

    section :footer, Sections::Footer, 'footer'
    section :get_started, Sections::GetStarted, 'div.jumbotron'
    section :header, Sections::Header, 'header'
    section :slider, Sections::Slider, '#slider'
  end
end
