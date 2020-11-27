RSpec.describe 'Reviews', type: :feature do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:login_page) { Pages::SignIn.new }
  let(:book_page) { Pages::Book.new }

  before do
    create(:review, user: user, book: book)
    login_page.load
    login_page.sign_in_form.authenticate_user(user.email, user.password)
    book_page.load(id: book.id)
  end

  context 'with reviews partial' do
    it { expect(book_page).to have_current_path(book_path(book)) }

    it { expect(book_page.reviews).to have_reviews }
    it { expect(book_page.reviews).to have_reviewers_names }
    it { expect(book_page.reviews).to have_reviewers_messages }
  end
end
