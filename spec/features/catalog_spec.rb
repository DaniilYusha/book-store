RSpec.describe 'CatalogPage', type: :feature do
  let(:catalog_page) { Pages::Catalog.new }

  before { visit books_path }

  it 'has current path' do
    expect(catalog_page).to have_current_path books_path
  end

  it 'has page name' do
    expect(catalog_page).to have_content I18n.t('catalog_page.page_name')
  end
end
