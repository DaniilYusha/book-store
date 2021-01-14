RSpec.describe Cart, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).optional }
  end

  describe 'with database indexes' do
    it { is_expected.to have_db_index(:user_id) }
  end
end
