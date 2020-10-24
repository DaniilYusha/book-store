RSpec.describe Address, type: :model do
  subject { create(:address, :for_user) }

  describe 'with database columns' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:zip_code).of_type(:string) }
    it { is_expected.to have_db_column(:city).of_type(:string) }
    it { is_expected.to have_db_column(:country).of_type(:string) }
    it { is_expected.to have_db_column(:address_type).of_type(:integer) }
    it { is_expected.to have_db_column(:phone).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:addressable) }
  end

  describe 'enum for address_type' do
    it { is_expected.to define_enum_for(:address_type).with_values(billing: 0, shipping: 1) }
  end
end
