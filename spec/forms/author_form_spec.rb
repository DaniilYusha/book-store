RSpec.describe AuthorForm, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_most(described_class::NAME_MAX_LENGTH) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(described_class::NAME_MAX_LENGTH) }
  end
end
