RSpec.describe AddressForm, type: :model do
  let(:valid_address) { build(:address) }
  let(:invalid_address) { build(:address, first_name: '!!!') }

  describe 'validations' do
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

    context 'when validates form successfully' do
      it { expect(described_class.new(valid_address)).to be_valid }
    end

    context 'when fails to validate form' do
      it { expect(described_class.new(invalid_address)).to be_invalid }
    end
  end
end
