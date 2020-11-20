RSpec.describe Category, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:books).dependent(:destroy) }
  end
end
