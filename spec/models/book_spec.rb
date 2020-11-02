RSpec.describe Book, type: :model do
  subject { create(:book) }

  describe 'associations' do
    it { is_expected.to have_many(:author_book).dependent(:destroy) }
    it { is_expected.to have_many(:authors).through(:author_book) }
    it { is_expected.to have_many(:book_material) }
    it { is_expected.to have_many(:materials).through(:book_material) }
    it { is_expected.to belong_to(:category) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(described_class::TITLE_MAX_LENGTH) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(described_class::MIN_PRICE) }
    it { is_expected.to validate_numericality_of(:price).is_less_than_or_equal_to(described_class::MAX_PRICE) }
    it { is_expected.to validate_presence_of(:published_at) }
  end
end
