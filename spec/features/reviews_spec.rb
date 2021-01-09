RSpec.describe 'Reviews', type: :feature do
  let_it_be(:user) { create(:user) }
  let_it_be(:book) { create(:book) }
  let(:book_page) { Pages::Book.new }

  before do
    login_as(user, scope: :user)
    book_page.load(id: book.id)
  end

  describe 'write_review partial' do
    context 'with page elements' do
      it { expect(book_page.write_review).to have_form_header }
      it { expect(book_page.write_review).to have_stars(count: 5) }
      it { expect(book_page.write_review).to have_title_field }
      it { expect(book_page.write_review).to have_text_field }
      it { expect(book_page.write_review).to have_post_button }
    end

    context 'when submit form with invalid rating' do
      let(:review_params) { attributes_for(:review, rating: 0) }
      let(:error_message) { "Rating must be greater than or equal to #{ReviewForm::RATING_RANGE.first}" }

      before { book_page.write_review.submit(review_params) }

      it { expect(book_page).not_to have_content(I18n.t('notice.review.created')) }
      it { expect(book_page).to have_content(error_message) }
    end

    context 'when submit form with invalid title' do
      let(:review_params) { attributes_for(:review, title: '') }

      before { book_page.write_review.submit(review_params) }

      it { expect(book_page).not_to have_content(I18n.t('notice.review.created')) }
      it { expect(book_page).to have_content(I18n.t('alert.blank')) }
    end

    context 'when submit form with invalid text' do
      let(:review_params) { attributes_for(:review, text: '') }

      before { book_page.write_review.submit(review_params) }

      it { expect(book_page).not_to have_content(I18n.t('notice.review.created')) }
      it { expect(book_page).to have_content(I18n.t('alert.blank')) }
    end
  end

  describe 'reviews partial' do
    let_it_be(:review) { create(:review, book: book, user: user).decorate }

    context 'with page elements' do
      it { expect(book_page.reviews).to have_reviews }
      it { expect(book_page.reviews).to have_reviewers_names }
      it { expect(book_page.reviews).to have_reviewers_messages }
      it { expect(book_page.reviews).to have_content(review.text) }
      it { expect(book_page.reviews).to have_content(review.user.email) }
      it { expect(book_page.reviews).to have_content(review.creation_date) }
    end
  end
end
