RSpec.describe AddressesController, type: :controller do
  let(:user) { create(:user) }
  let(:billing_address) { create(:address, :for_user) }
  let(:shipping_address) { create(:address, :for_user, address_type: :shipping) }
  let(:billing_address_params) do
    {
      first_name: billing_address.first_name, last_name: billing_address.last_name,
      address: billing_address.address, address_type: billing_address.address_type,
      zip_code: billing_address.zip_code, city: billing_address.city,
      country: billing_address.country, phone: billing_address.phone
    }
  end
  let(:shipping_address_params) do
    {
      first_name: shipping_address.first_name, last_name: shipping_address.last_name,
      address: shipping_address.address, address_type: shipping_address.address_type,
      zip_code: shipping_address.zip_code, city: shipping_address.city,
      country: shipping_address.country, phone: shipping_address.phone
    }
  end

  before { sign_in(user) }

  describe 'POST /addresses' do
    before do
      get :create, params: { address_form: billing_address_params }
    end

    it { expect(response).to redirect_to(edit_user_registration_path) }
    it { expect(response).to have_http_status(:found) }
  end

  describe 'PUT /address/{id}' do
    context 'when update billing address' do
      before do
        get :update, params: { address_form: billing_address_params,
                               id: billing_address.id }
      end

      it { expect(response).to redirect_to(edit_user_registration_path) }
      it { expect(response).to have_http_status(:found) }
    end

    context 'when update shipping address' do
      before do
        get :update, params: { address_form: shipping_address_params,
                               id: shipping_address.id }
      end

      it { expect(response).to redirect_to(edit_user_registration_path) }
      it { expect(response).to have_http_status(:found) }
    end
  end
end
