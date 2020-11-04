module Sections
  class Sorting < SitePrism::Section
    elements :categories_links, "ul.list-inline li:nth-last-child(-n+#{PagesController::NEWEST_BOOKS_COUNT})"
    elements :sorting_links, 'div.dropdown > ul.dropdown-menu li'
  end
end
