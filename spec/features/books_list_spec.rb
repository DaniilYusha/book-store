RSpec.describe 'BooksList', type: :feature do
  let(:catalog_page) { Pages::Catalog.new }
  let!(:books) { create_list(:book, 2) }

  before { catalog_page.load }

  context 'with books_list partial' do
    it { expect(catalog_page).to have_current_path(books_path) }

    it { expect(catalog_page.books_list).to have_books(count: 2) }
  end
end
