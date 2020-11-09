RSpec.describe ReviewsController, type: :controller do
  let(:book) { create(:book) }
  let(:user) { create(:user) }

  describe 'POST /reviews' do
    let(:review_attributes) { attributes_for(:review) }
    let(:params) do
      { review_form: { title: review_attributes[:title], text:
      review_attributes[:text], rating: review_attributes[:rating], book_id:
      book.id, user_id: user.id } }
    end

    before do
      sign_in user
      get :create, params: params
    end

    it { expect(response).to have_http_status :redirect }
  end
end
