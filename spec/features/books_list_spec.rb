RSpec.describe 'BooksList', type: :feature do
  CREATED_BOOKS_COUNT = 20
  
  let(:catalog_page) { Pages::Catalog.new }

  before(:all) { create_list(:book, CREATED_BOOKS_COUNT) }
  before(:each) { visit books_path }

  it 'has books' do
    expect(catalog_page.books_list).to have_books
  end

  it 'has view-more button' do
    expect(catalog_page.books_list).to have_view_more_button
  end
end
