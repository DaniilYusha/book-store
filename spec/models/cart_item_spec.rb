RSpec.describe CartItem, type: :model do
  describe 'with database columns' do
    it { is_expected.to have_db_column(:quantity).of_type(:integer) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:cart) }
    it { is_expected.to belong_to(:book) }
  end

  describe 'validations' do
    it { is_expected.to validate_numericality_of(:quantity).only_integer }
  end
end
