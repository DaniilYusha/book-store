RSpec.describe 'BooksList', type: :feature do
  let_it_be(:books) { create_list(:book, 2) }
  let(:catalog_page) { Pages::Catalog.new }

  before { catalog_page.load }

  context 'with books_list partial' do
    it { expect(catalog_page).to have_current_path(books_path) }

    it { expect(catalog_page.books_list).to have_books(count: 2) }
  end
end
