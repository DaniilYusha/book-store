module Pages
  class Book < SitePrism::Page
    set_url '/books{/book_id}'

    section :book_description, Sections::BookDescription, '.container > div.row'
    section :write_review, Sections::WriteReview, '.container > div.write-review'
    section :reviews, Sections::Reviews, '.container > div.reviews'
  end
end