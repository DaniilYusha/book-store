require 'ffaker'

CREATED_AUTHORS_COUNT = 80
CREATED_BOOKS_COUNT = 80
CREATED_MATERIALS_COUNT = 7
CREATED_CATEGORIES = {
  mobile_development: 'Mobile Development',
  photo: 'Photo',
  web_design: 'Web Design',
  web_development: 'Web Development'
}.freeze

CREATED_AUTHORS_COUNT.times do
  Author.create(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name
  )
end

CREATED_CATEGORIES.each_value do |category|
  Category.create name: category
end

CREATED_BOOKS_COUNT.times do
  Book.create(
    title: FFaker::Book.title,
    description: FFaker::Book.description,
    price: rand(1.0..1000.0).floor(2),
    height: rand(7.0..40.0).floor(2),
    width: rand(1.0..20.0).floor(2),
    depth: rand(1.0..7.0).floor(2),
    published_at: FFaker::Time.date,
    category_id: rand(1..CREATED_CATEGORIES.size)
  )
end

CREATED_MATERIALS_COUNT.times do
  Material.create(
    name: FFaker::Lorem.unique.word
  )
end

(1..CREATED_AUTHORS_COUNT).each do |index|
  AuthorBook.create(author_id: index, book_id: index)
end

(1..CREATED_BOOKS_COUNT).each do |book_id|
  (1..(CREATED_MATERIALS_COUNT - rand(CREATED_MATERIALS_COUNT - 1))).each do |material_id|
    BookMaterial.create(book_id: book_id, material_id: material_id)
  end
end
