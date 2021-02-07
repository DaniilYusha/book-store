RSpec.describe Order, type: :model do
  subject(:order) { described_class.new }

  describe 'associations' do
    it { is_expected.to belong_to(:user).optional }
    it { is_expected.to have_many(:order_items).dependent(:destroy) }
    it { is_expected.to have_one(:coupon).dependent(:nullify) }
  end

  describe 'with database indexes' do
    it { is_expected.to have_db_index(:user_id) }
  end

  describe 'enum for status' do
    it {
      expect(order).to define_enum_for(:status)
        .with_values(pending: 0, address: 1, delivery: 2, payment: 3, confirm: 4, complete: 5)
    }
  end
end
