RSpec.describe CategoryForm, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(described_class::NAME_MAX_LENGTH) }
  end
end
