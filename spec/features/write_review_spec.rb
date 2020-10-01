RSpec.describe 'WriteReview', type: :feature do
  let(:book) { create(:book_with_associations).decorate }
  let(:book_page) { Pages::Book.new }

  before { visit book_path(book) }

  it 'has current path' do
    expect(book_page).to have_current_path book_path(book)
  end

  it 'has write review text' do
    expect(book_page.write_review).to have_write_review_text
  end

  it 'has scores' do
    expect(book_page.write_review).to have_scores
  end

  it 'has title field' do
    expect(book_page.write_review).to have_title_field
  end

  it 'has review field' do
    expect(book_page.write_review).to have_review_field
  end
end
