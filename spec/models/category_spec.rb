RSpec.describe Category, type: :model do
  subject { create(:category) }

  describe 'associations' do
    it { is_expected.to have_many(:books).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
