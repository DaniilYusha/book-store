RSpec.describe Review, type: :model do
  describe 'with database columns' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:text).of_type(:text) }
    it { is_expected.to have_db_column(:rating).of_type(:integer) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
    it { is_expected.to have_db_column(:is_verified).of_type(:boolean).with_options(default: false) }
  end

  describe 'with indexes' do
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index(:book_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'enum for status' do
    it { is_expected.to define_enum_for(:status) }
  end
end
