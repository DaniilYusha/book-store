RSpec.describe 'WriteReview', type: :feature do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:login_page) { Pages::SignIn.new }
  let(:book_page) { Pages::Book.new }

  before do
    login_page.load
    login_page.sign_in_form.authenticate_user(user.email, user.password)
    book_page.load(id: book.id)
  end

  it { expect(book_page).to have_current_path book_path(book) }
  it { expect(book_page.write_review).to have_write_review_text }
  it { expect(book_page.write_review).to have_scores }
  it { expect(book_page.write_review).to have_title_field }
  it { expect(book_page.write_review).to have_review_field }
end
