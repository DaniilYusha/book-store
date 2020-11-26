RSpec.describe 'Sorting', type: :feature do
  let(:catalog_page) { Pages::Catalog.new }
  let(:categories) { create_list(:category, 2) }

  before { catalog_page.load }

  context 'with sorting partial' do
    it { expect(catalog_page).to have_current_path(books_path) }

    it { expect(catalog_page.sorting).to have_categories_links }
    it { expect(catalog_page.sorting).to have_sorting_links }
  end
end
