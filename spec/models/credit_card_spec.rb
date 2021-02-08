RSpec.describe CreditCard, type: :model do
  describe 'with database columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:number).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:date).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:cvv).of_type(:string).with_options(null: false) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:order) }
  end

  describe 'with database indexes' do
    it { is_expected.to have_db_index(:order_id) }
  end
end
