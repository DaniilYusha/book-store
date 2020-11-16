RSpec.describe Cart, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).optional }
  end
end
