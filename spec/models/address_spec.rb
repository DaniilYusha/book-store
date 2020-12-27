RSpec.describe Address, type: :model do
  subject { create(:address, :for_user) }

  describe 'with database columns' do
    %i[first_name last_name address zip_code city country phone].each do |field|
      it { is_expected.to have_db_column(field).of_type(:string) }
    end

    it { is_expected.to have_db_column(:address_type).of_type(:integer) }
  end

  describe 'with database indexes' do
    it { is_expected.to have_db_index([:addressable_type, :addressable_id]) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:addressable) }
  end

  describe 'enum for address_type' do
    it { is_expected.to define_enum_for(:address_type).with_values(billing: 0, shipping: 1) }
  end
end
