RSpec.describe Book, type: :model do
  subject { create(:book) }

  describe 'associations' do
    it { is_expected.to have_many(:author_books).dependent(:destroy) }
    it { is_expected.to have_many(:authors).through(:author_books).dependent(:destroy) }
    it { is_expected.to belong_to(:category) }
  end
end
