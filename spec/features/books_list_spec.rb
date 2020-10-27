RSpec.describe 'BooksList', type: :feature do
  let(:catalog_page) { Pages::Catalog.new }

  before do
    create_list(:book, 13)
    visit books_path
  end

  it 'has books' do
    expect(catalog_page.books_list).to have_books
  end

  it 'has view-more button' do
    expect(catalog_page.books_list).to have_view_more_button
  end
end
