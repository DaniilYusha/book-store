RSpec.describe Author, type: :model do
  subject { create(:author) }

  describe 'associations' do
    it { should have_many(:author_book).dependent(:destroy) }
    it { should have_many(:books).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:first_name).is_at_most(described_class::NAME_MAX_LENGTH) }
    it { should validate_length_of(:last_name).is_at_most(described_class::NAME_MAX_LENGTH) }
  end
end
