RSpec.describe Order, type: :model do
  subject(:order) { described_class.new }

  describe 'associations' do
    it { is_expected.to belong_to(:user).optional }
    it { is_expected.to belong_to(:delivery).optional }
    it { is_expected.to have_many(:order_items).dependent(:destroy) }
    it { is_expected.to have_one(:coupon).dependent(:nullify) }
    it { is_expected.to have_one(:credit_card).dependent(:destroy) }
  end

  describe 'with database indexes' do
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index(:delivery_id) }
  end

  describe 'enum for status' do
    it do
      expect(order).to define_enum_for(:status).with_values(
        pending: 0, address: 1, delivery: 2, payment: 3, confirm: 4,
        complete: 5, in_delivery: 6, delivered: 7, canceled: 8
      )
    end
  end
end
