RSpec.describe AuthorBook, type: :model do
  describe 'associations' do
    it { should belong_to(:author) }
    it { should belong_to(:book) }
  end
end
