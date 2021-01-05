RSpec.describe ReviewsController, type: :controller do
  let(:book) { create(:book) }
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'POST /reviews' do
    before { get :create, params: { review: params } }

    context 'with valid params' do
      let(:params) { attributes_for(:review, book_id: book.id, user_id: user.id) }

      it { expect(response).to have_http_status(:found) }
    end

    context 'with invalid params' do
      let(:params) { attributes_for(:review, book_id: book.id, user_id: user.id, text: '') }

      it { expect(response).to have_http_status(:found) }
    end
  end
end
