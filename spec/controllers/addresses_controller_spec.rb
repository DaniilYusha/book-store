RSpec.describe AddressesController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'POST /addresses' do
    context 'when params are valid' do
      let(:valid_billing) { attributes_for(:address) }
      let(:valid_shipping) { attributes_for(:address, address_type: :shipping) }
      let(:address_params) { { billing: valid_billing, shipping: valid_shipping } }

      before { get :create, params: { address: address_params } }

      it { expect(response).to redirect_to(edit_user_registration_path) }
      it { expect(response).to have_http_status(:found) }
    end

    context 'when params are invalid' do
      let(:invalid_billing) { attributes_for(:address, city: '') }
      let(:invalid_shipping) { attributes_for(:address, address_type: :shipping, city: '') }
      let(:address_params) { { billing: invalid_billing, shipping: invalid_shipping } }

      before { get :create, params: { address: address_params } }

      it { expect(response).to have_http_status(:ok) }
    end
  end
end
