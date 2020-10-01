RSpec.describe 'Sorting', type: :feature do
  let(:categories) { create_list(:category, PagesController::LAST_ADDED_BOOKS_COUNT) }
  let(:catalog_page) { Pages::Catalog.new }

  before do
    visit books_path
  end

  it 'has categories links' do
    expect(catalog_page.sorting).to have_categories_links
  end

  it 'has sorting links' do
    expect(catalog_page.sorting).to have_sorting_links
  end
end
