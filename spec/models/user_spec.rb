RSpec.describe User, type: :model do
  describe 'datebase columns' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:provider).of_type(:string) }
    it { is_expected.to have_db_column(:uid).of_type(:string) }
  end

  describe '.from_omniauth' do
    let(:auth) { OmniAuth::AuthHash.new(Faker::Omniauth.facebook) }

    it 'returns or create user' do
      user = described_class.from_omniauth auth
      expect(user.uid).to eq auth.uid
    end
  end
end