RSpec.describe AddressesController, type: :controller do
  let(:user) { create(:user) }
  let(:address) { create(:address, addressable: user) }
  let(:valid_params) { attributes_for(:address) }
  let(:invalid_params) { attributes_for(:address, city: '') }

  before { sign_in(user) }

  describe 'POST /addresses' do
    context 'when params are valid' do
      before { post :create, params: { address: valid_params } }

      it { expect(response).to redirect_to(edit_user_registration_path) }
      it { expect(response).to have_http_status(:found) }
    end

    context 'when params are invalid' do
      before { post :create, params: { address: invalid_params } }

      it { expect(response).to have_http_status(:ok) }
    end
  end

  describe 'PUT /addresses' do
    context 'when params are valid' do
      before { put :update, params: { id: address.id, address: valid_params } }

      it { expect(response).to redirect_to(edit_user_registration_path) }
      it { expect(response).to have_http_status(:found) }
    end

    context 'when params are invalid' do
      before { put :update, params: { id: address.id, address: invalid_params } }

      it { expect(response).to have_http_status(:ok) }
    end
  end
end
