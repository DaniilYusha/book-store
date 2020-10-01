RSpec.describe 'BookDescription', type: :feature do
  let(:book) { create(:book_with_associations).decorate }
  let(:book_page) { Pages::Book.new }

  before { visit book_path(book) }

  it 'has current path' do
    expect(book_page).to have_current_path book_path(book)
  end

  it 'has book title' do
    expect(book_page.book_description).to have_book_title
  end

  it 'has book authors' do
    expect(book_page.book_description).to have_book_authors
  end

  it 'has book price' do
    expect(book_page.book_description).to have_book_price
  end

  it 'has add to cart button' do
    expect(book_page.book_description).to have_add_to_cart_button
  end

  it 'has book description' do
    expect(book_page.book_description).to have_book_description
  end

  it 'has book publication year' do
    expect(book_page.book_description).to have_publication_year
  end

  it 'has book dimensions' do
    expect(book_page.book_description).to have_dimensions
  end

  it 'has book materials' do
    expect(book_page.book_description).to have_materials
  end
end
