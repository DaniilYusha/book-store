# if Rails.env.development?
after :authors do
  authors = Author.all
  80.times do
    Book.create(
      title: FFaker::Book.title,
      description: FFaker::Book.description,
      price: rand(1.0..1000.0).floor(2),
      height: rand(7.0..40.0).floor(2),
      width: rand(1.0..20.0).floor(2),
      depth: rand(1.0..7.0).floor(2),
      published_at: FFaker::Time.date,
      materials: FFaker::Lorem.word,
      category_id: rand(1..Category.count),
      authors: [authors.sample, authors.sample]
    )
  end
end
# end
