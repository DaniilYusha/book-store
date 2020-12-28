RSpec.describe AddressesController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'POST /addresses' do
    before { post :create, params: { address: params } }

    context 'when save billing address with valid params' do
      let(:params) { attributes_for(:address) }

      it { expect(response).to redirect_to(settings_path) }
      it { expect(response).to have_http_status(:found) }
    end

    context 'when save billing address with invalid params' do
      let(:params) { attributes_for(:address, city: '') }

      it { expect(response).to have_http_status(:ok) }
    end

    context 'when save shipping address with valid params' do
      let(:params) { attributes_for(:address, address_type: 'shipping') }

      it { expect(response).to redirect_to(settings_path) }
      it { expect(response).to have_http_status(:found) }
    end

    context 'when save shipping address with invalid params' do
      let(:params) { attributes_for(:address, address_type: 'shipping', city: '') }

      it { expect(response).to have_http_status(:ok) }
    end
  end
end
