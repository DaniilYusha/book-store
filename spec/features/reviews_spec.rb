RSpec.describe 'Reviews', type: :feature do
  let(:book) { create(:book_with_associations).decorate }
  let(:book_page) { Pages::Book.new }

  before { visit book_path(book) }

  it 'has current path' do
    expect(book_page).to have_current_path book_path(book)
  end

  it 'has reviews' do
    expect(book_page.reviews).to have_reviews
  end

  it 'has reviewers names' do
    expect(book_page.reviews).to have_reviewers_names
  end

  it 'has reviewers messages' do
    expect(book_page.reviews).to have_reviewers_messages
  end
end
