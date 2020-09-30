RSpec.describe BookMaterial, type: :model do
  describe 'associations' do
    it { should belong_to(:book) }
    it { should belong_to(:material) }
  end
end
