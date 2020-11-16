RSpec.describe CartsController, type: :controller do
  describe 'GET /carts/{id}' do
    let(:cart) { create(:cart) }

    before { get :show, params: { id: cart.id } }

    it { expect(response).to have_http_status :success }
  end
end
