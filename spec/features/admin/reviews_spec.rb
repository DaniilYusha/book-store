RSpec.describe 'admin/reviews', type: :feature do
  let_it_be(:user) { create(:user) }
  let_it_be(:book) { create(:book) }
  let(:admin) { create(:admin_user) }

  before { login_as(admin) }

  describe '#index' do
    let(:reviews_page) { Pages::Admin::Reviews.new }

    before { reviews_page.load }

    context 'with page elements' do
      let_it_be(:review) { create(:review, status: :unprocessed, book: book, user: user) }

      %i[id_column book_column title_column created_at_column user_column
         status_column unprocessed_link approved_link rejected_link].each do |element|
        it { expect(reviews_page.main_content).to public_send("have_#{element}") }
      end
    end

    context 'with unprocessed reviews' do
      let_it_be(:review) { create(:review, status: :unprocessed, book: book, user: user) }

      before { reviews_page.main_content.unprocessed_link.click }

      it { expect(reviews_page.main_content).to have_content(review.book.title) }
      it { expect(reviews_page.main_content).to have_content(review.title) }
      it { expect(reviews_page.main_content).to have_content(review.user.email) }
      it { expect(reviews_page.main_content).to have_content(review.status) }
    end

    context 'with approved reviews' do
      let_it_be(:review) { create(:review, status: :approved, book: book, user: user) }

      before { reviews_page.main_content.approved_link.click }

      it { expect(reviews_page.main_content).to have_content(review.book.title) }
      it { expect(reviews_page.main_content).to have_content(review.title) }
      it { expect(reviews_page.main_content).to have_content(review.user.email) }
      it { expect(reviews_page.main_content).to have_content(review.status) }
    end

    context 'with rejected reviews' do
      let_it_be(:review) { create(:review, status: :rejected, book: book, user: user) }

      before { reviews_page.main_content.rejected_link.click }

      it { expect(reviews_page.main_content).to have_content(review.book.title) }
      it { expect(reviews_page.main_content).to have_content(review.title) }
      it { expect(reviews_page.main_content).to have_content(review.user.email) }
      it { expect(reviews_page.main_content).to have_content(review.status) }
    end
  end

  describe '#show' do
    let_it_be(:review) { create(:review, status: :unprocessed, book: book, user: user) }
    let(:review_page) { Pages::Admin::Review.new }

    before { review_page.load(id: review.id) }

    context 'with page elements' do
      it { expect(review_page.review_details).to have_header }
      it { expect(review_page.review_details).to have_title_row }
      it { expect(review_page.review_details).to have_text_row }
      it { expect(review_page.review_details).to have_rating_row }
      it { expect(review_page.review_details).to have_status_row }
      it { expect(review_page.review_details).to have_is_verified_row }
      it { expect(review_page.review_details).to have_user_row }
      it { expect(review_page.review_details).to have_book_row }
      it { expect(review_page.actions).to have_approve_button }
      it { expect(review_page.actions).to have_reject_button }

      it { expect(review_page.review_details.title_row).to have_content(review.title) }
      it { expect(review_page.review_details.text_row).to have_content(review.text) }
      it { expect(review_page.review_details.rating_row).to have_content(review.rating) }
      it { expect(review_page.review_details.status_row).to have_content(review.status) }
      it { expect(review_page.review_details.user_row).to have_content(review.user.email) }
      it { expect(review_page.review_details.book_row).to have_content(review.book.title) }
    end

    context 'when click approve button' do
      before { review_page.actions.approve_button.click }

      it { expect(review_page).to have_content(I18n.t('active_admin.approved')) }
      it { expect(review_page.actions).not_to have_approve_button }
    end

    context 'when click reject button' do
      before { review_page.actions.reject_button.click }

      it { expect(review_page).to have_content(I18n.t('active_admin.rejected')) }
      it { expect(review_page.actions).not_to have_reject_button }
    end
  end
end
