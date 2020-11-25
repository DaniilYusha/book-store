RSpec.describe AddressForm, type: :model do
  subject { described_class.new(user) }

  let(:user) { create(:user) }

  context 'with validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(described_class::NAME_MAX_LENGTH) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(described_class::NAME_MAX_LENGTH) }
    it { is_expected.to validate_length_of(:country).is_at_most(described_class::NAME_MAX_LENGTH) }
    it { is_expected.to validate_length_of(:city).is_at_most(described_class::NAME_MAX_LENGTH) }
    it { is_expected.to validate_length_of(:address).is_at_most(described_class::ADDRESS_MAX_LENGTH) }
    it { is_expected.to validate_length_of(:zip_code).is_at_most(described_class::ZIP_MAX_LENGTH) }
    it { is_expected.to validate_length_of(:phone).is_at_most(described_class::PHONE_MAX_LENGTH) }

    context 'when validates params successfully' do
      let(:valid_address_params) { attributes_for(:address) }

      it { expect(described_class.new(user, valid_address_params)).to be_valid }
    end

    context 'when params validation fails' do
      let(:invalid_address_params) { attributes_for(:address, first_name: '!!!') }

      it { expect(described_class.new(invalid_address_params)).to be_invalid }
    end
  end

  describe '#validate' do
    context 'when params are invalid' do
      let(:invalid_billing_params) { attributes_for(:address, zip_code: '') }
      let(:invalid_shipping_params) { attributes_for(:address, address_type: AddressForm::SHIPPING_TYPE, zip_code: '') }

      it 'returns errors hash for billing params' do
        expect(described_class.new(user, invalid_billing_params).validate.class).to eq(Hash)
      end

      it 'returns errors hash for shipping params' do
        expect(described_class.new(user, invalid_shipping_params).validate.class).to eq(Hash)
      end
    end

    context 'when params are valid' do
      let(:valid_params) { attributes_for(:address) }

      it { expect(described_class.new(user, valid_params).validate).to eq(nil) }
    end
  end
end
