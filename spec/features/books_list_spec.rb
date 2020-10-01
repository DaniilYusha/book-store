RSpec.describe 'BooksList', type: :feature do
  before do
    stub_const('CREATED_BOOKS_COUNT', 20)
    create_list(:book, CREATED_BOOKS_COUNT)
    visit books_path
  end

  let(:catalog_page) { Pages::Catalog.new }

  it 'has books' do
    expect(catalog_page.books_list).to have_books
  end

  it 'has view-more button' do
    expect(catalog_page.books_list).to have_view_more_button
  end
end
