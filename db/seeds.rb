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
    first_name: FFaker::Book.author.split.first,
    last_name: FFaker::Book.author.split.last
  )
end

CREATED_CATEGORIES.each_value do |category|
  Category.create name: category
end

CREATED_BOOKS_COUNT.times do
  Book.create(
    title: FFaker::Book.title,
    description: FFaker::Books::Dune.quote,
    price: FFaker::Commerce.price(range: 0..1000.0),
    height: FFaker::Number.decimal(l_digits: 2),
    width: FFaker::Number.decimal(l_digits: 2),
    depth: FFaker::Number.decimal(l_digits: 2),
    published_at: FFaker::Date.between(from: '1990-01-01', to: '2020-09-15'),
    category_id: FFaker::Number.between(from: 1, to: CREATED_CATEGORIES.size)
  )
end

CREATED_MATERIALS_COUNT.times do
  Material.create(
    name: FFaker::Construction.unique.material
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
