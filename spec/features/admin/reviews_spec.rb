RSpec.describe 'admin/reviews', type: :feature do
  let!(:review) { create(:review, status: 0) }
  let(:admin) { create(:admin_user) }
  let(:login_page) { Pages::Admin::LogIn.new }
  let(:reviews_page) { Pages::Admin::Reviews.new }

  before do
    login_page.load
    login_page.form.fill_in(admin.email, admin.password)
  end

  describe '#index' do
    before { reviews_page.load }

    it { expect(reviews_page).to have_content(review.title) }
    it { expect(reviews_page.main_content).to have_id_column }
    it { expect(reviews_page.main_content).to have_book_column }
    it { expect(reviews_page.main_content).to have_title_column }
    it { expect(reviews_page.main_content).to have_created_at_column }
    it { expect(reviews_page.main_content).to have_user_column }
    it { expect(reviews_page.main_content).to have_status_column }
  end

  describe '#show' do
    let(:review_page) { Pages::Admin::Review.new }

    before { review_page.load(id: review.id) }

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

    context 'when click approve button' do
      before { review_page.actions.approve_button.click }

      it { expect(review_page).to have_content(I18n.t('active_admin.approved')) }
    end

    context 'when click reject button' do
      before { review_page.actions.reject_button.click }

      it { expect(review_page).to have_content(I18n.t('active_admin.rejected')) }
    end
  end
end
