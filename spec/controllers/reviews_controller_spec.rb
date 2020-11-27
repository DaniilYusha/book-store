RSpec.describe ReviewsController, type: :controller do
  let(:book) { create(:book) }
  let(:user) { create(:user) }

  describe 'POST /reviews' do
    let(:review_attributes) { attributes_for(:review, book: book, user: user) }

    before do
      sign_in user
      get :create, params: { review: review_attributes }
    end

    it { expect(response).to have_http_status :redirect }
  end
end
