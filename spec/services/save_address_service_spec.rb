RSpec.describe SaveAddressService do
  let(:user) { create(:user) }
  let(:invalid_billing_params) { attributes_for(:address, zip_code: '', first_name: '!!!') }
  let(:valid_billing_params) { attributes_for(:address) }
  let(:invalid_shipping_params) { attributes_for(:address, address_type: 'shipping', city: '') }
  let(:valid_shipping_params) { attributes_for(:address, address_type: 'shipping') }

  describe '#call' do
    context 'with valid billing params' do
      it 'returns true' do
        expect(described_class.new(user: user, params: valid_billing_params).call).to eq(true)
      end
    end

    context 'with invalid billing params' do
      it 'returns Hash with errors' do
        expect(described_class.new(user: user, params: invalid_billing_params).call.class).to eq(Hash)
      end

      it 'returns Hash with two errors' do
        expect(described_class.new(user: user, params: invalid_billing_params).call.count).to eq(2)
      end
    end

    context 'with valid shipping params' do
      it 'returns true' do
        expect(described_class.new(user: user, params: valid_shipping_params).call).to eq(true)
      end
    end

    context 'with invalid shipping params' do
      it 'returns Hash with errors' do
        expect(described_class.new(user: user, params: invalid_shipping_params).call.class).to eq(Hash)
      end

      it 'returns Hash with one error' do
        expect(described_class.new(user: user, params: invalid_shipping_params).call.count).to eq(1)
      end
    end
  end
end
