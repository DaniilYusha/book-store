require 'faker'

CREATED_AUTHORS_COUNT = 20
CREATED_BOOKS_COUNT = 20

CREATED_AUTHORS_COUNT.times do
  Author.create(
    name: Faker::Book.unique.author
  )
end

CREATED_BOOKS_COUNT.times do
  Book.create(
    title: Faker::Book.unique.title,
    description: Faker::Lorem.sentence(random_words_to_add: 10)
  )
end

(1..CREATED_AUTHORS_COUNT).each do |index|
  AuthorBook.create(author_id: index, book_id: index)
end
