class FindBookQuery
  attr_reader :book_id

  def self.call(book_id)
    new(book_id).call
  end

  def initialize(book_id)
    @book_id = book_id
  end

  def call
    Book.includes(:authors).find_by(id: book_id)
  end
end
