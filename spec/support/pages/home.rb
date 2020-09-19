class Home < SitePrism::Page
  set_url '/'

  section :footer, Footer, 'footer'
  section :get_started, GetStarted, 'div.jumbotron'
  section :header, Header, 'header'
  section :slider, Slider, '#slider'
end
