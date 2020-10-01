RSpec.describe BookMaterial, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:material) }
  end
end
