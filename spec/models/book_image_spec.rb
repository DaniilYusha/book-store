RSpec.describe BookImage, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:book) }
  end

  describe 'with database columns' do
    it { is_expected.to have_db_column(:image).of_type(:string) }
  end

  describe 'with indexes' do
    it { is_expected.to have_db_index(:book_id) }
  end
end
