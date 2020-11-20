RSpec.describe 'BooksList', type: :feature do
  let(:catalog_page) { Pages::Catalog.new }

  before do
    create_list(:book, 2)
    catalog_page.load
  end

  it { expect(catalog_page).to have_current_path(books_path) }

  it { expect(catalog_page.books_list).to have_books(count: 2) }
end
