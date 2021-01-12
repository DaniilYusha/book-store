RSpec.describe CartsController, type: :controller do
  describe 'GET /carts' do
    let(:cart) { create(:cart) }

    before { get :index }

    it { expect(response).to have_http_status(:success) }
  end
end
