RSpec.describe Book, type: :model do
  subject { create(:book) }

  describe 'associations' do
    it { should have_many(:author_book).dependent(:destroy) }
    it { should have_many(:authors).dependent(:destroy) }
    it { should have_many(:book_material) }
    it { should have_many(:materials) }
    it { should belong_to(:category) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(described_class::TITLE_MAX_LENGTH) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(described_class::MIN_PRICE) }
    it { should validate_numericality_of(:price).is_less_than(described_class::MAX_PRICE) }
    it { should validate_presence_of(:published_at) }
  end
end
