RSpec.describe PersistAddressService do
  let(:user) { create(:user) }
  let(:valid_params) { attributes_for(:address) }
  let(:invalid_params) { attributes_for(:address, zip_code: '') }

  describe '#call' do
    context 'with valid params' do
      it 'returns true' do
        expect(described_class.new(user: user, params: valid_params).call).to be true
      end
    end

    context 'with invalid params' do
      it 'returns false' do
        expect(described_class.new(user: user, params: invalid_params).call).to be false
      end
    end
  end
end
