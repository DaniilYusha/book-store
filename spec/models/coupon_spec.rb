RSpec.describe Coupon, type: :model do
  describe 'with database columns' do
    it { is_expected.to have_db_column(:code).of_type(:string) }
    it { is_expected.to have_db_column(:discount).of_type(:decimal) }
    it { is_expected.to have_db_column(:is_valid).of_type(:boolean).with_options(default: true) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:cart).optional }
  end

  describe 'with database indexes' do
    it { is_expected.to have_db_index(:cart_id) }
  end
end
