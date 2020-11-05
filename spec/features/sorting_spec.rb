RSpec.describe 'Sorting', type: :feature do
  let(:catalog_page) { Pages::Catalog.new }

  before do
    create_list(:category, 2)
    catalog_page.load
  end

  it { expect(catalog_page).to have_current_path(books_path) }

  it { expect(catalog_page.sorting).to have_categories_links }
  it { expect(catalog_page.sorting).to have_sorting_links }
end
