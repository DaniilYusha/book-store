RSpec.describe 'CatalogPage', type: :feature do
  let(:catalog_page) { Pages::Catalog.new }

  before { catalog_page.load }

  context 'with catalog page' do
    it { expect(catalog_page).to have_current_path(books_path) }

    it { expect(catalog_page).to have_sorting }
    it { expect(catalog_page).to have_books_list }

    it 'has page name' do
      expect(catalog_page).to have_content I18n.t('catalog_page.page_name')
    end
  end
end
