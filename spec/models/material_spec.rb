RSpec.describe Material, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:book_material) }
    it { is_expected.to have_many(:books).through(:book_material) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
