RSpec.describe Cart, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).optional }
    it { is_expected.to have_many(:cart_items).dependent(:destroy) }
    it { is_expected.to have_one(:coupon).dependent(:nullify) }
  end

  describe 'with database indexes' do
    it { is_expected.to have_db_index(:user_id) }
  end
end
