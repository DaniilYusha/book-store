RSpec.describe 'BookDescription', type: :feature do
  let(:book) { create(:book) }
  let(:book_page) { Pages::Book.new }

  before { book_page.load(id: book.id) }

  it { expect(book_page).to have_current_path(book_path(book)) }

  it { expect(book_page.book_description).to have_book_title }
  it { expect(book_page.book_description).to have_book_authors }
  it { expect(book_page.book_description).to have_book_price }
  it { expect(book_page.book_description).to have_add_to_cart_button }
  it { expect(book_page.book_description).to have_book_description }
  it { expect(book_page.book_description).to have_publication_year }
  it { expect(book_page.book_description).to have_dimensions }
  it { expect(book_page.book_description).to have_materials }
end
