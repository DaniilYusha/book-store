RSpec.describe Category, type: :model do
  subject { create(:category) }

  describe 'associations' do
    it { should have_many(:books).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
