RSpec.describe OrderItem, type: :model do
  describe 'with database columns' do
    it { is_expected.to have_db_column(:quantity).of_type(:integer) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:cart) }
    it { is_expected.to belong_to(:book) }
  end

  describe 'with database indexes' do
    it { is_expected.to have_db_index(:cart_id) }
    it { is_expected.to have_db_index(:book_id) }
  end
end
