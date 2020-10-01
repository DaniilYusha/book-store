RSpec.describe Material, type: :model do
  describe 'associations' do
    it { should have_many(:book_material) }
    it { should have_many(:books).through(:book_material) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
