RSpec.describe User, type: :model do
  describe 'datebase columns' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:provider).of_type(:string) }
    it { is_expected.to have_db_column(:uid).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:billing_address).class_name('Address').dependent(:destroy) }
    it { is_expected.to have_one(:shipping_address).class_name('Address').dependent(:destroy) }
  end

  describe '.from_omniauth' do
    let(:auth) { OmniAuth.config.mock_auth[:facebook] }

    it 'returns or create user' do
      user = described_class.from_omniauth auth
      expect(user.uid).to eq auth.uid
    end
  end
end
