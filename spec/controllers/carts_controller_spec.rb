RSpec.describe CartsController, type: :controller do
  describe 'GET /carts' do
    let(:order) { create(:order) }

    before { get :show }

    it { expect(response).to have_http_status(:success) }
  end
end
