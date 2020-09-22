require 'faker'

CREATED_AUTHORS_COUNT = 20
CREATED_BOOKS_COUNT = 20
CREATED_MATERIALS_COUNT = 7
CREATED_CATEGORIES = {
  mobile_development: 'Mobile Development',
  photo: 'Photo',
  web_design: 'Web Design'
}

CREATED_AUTHORS_COUNT.times do
  Author.create(
    first_name: Faker::Book.author.split.first,
    last_name: Faker::Book.author.split.last
  )
end

CREATED_CATEGORIES.each_value do |category|
  Category.create name: category
end

CREATED_BOOKS_COUNT.times do
  Book.create(
    title: Faker::Book.title,
    description: Faker::Books::Dune.quote,
    price: Faker::Commerce.price(range: 0..1000.0),
    height: Faker::Number.decimal(l_digits: 2),
    width: Faker::Number.decimal(l_digits: 2),
    depth: Faker::Number.decimal(l_digits: 2),
    published_at: Faker::Date.between(from: '1990-01-01', to: '2020-09-15'),
    category_id: Faker::Number.between(from: 1, to: CREATED_CATEGORIES.size)
  )
end

CREATED_MATERIALS_COUNT.times do
  Material.create(
    name: Faker::Construction.unique.material
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
# first_name, last_name = Faker::Book.author.split
# puts first_name + " " + last_name
