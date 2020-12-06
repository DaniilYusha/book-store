RSpec.describe BookForm, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:category_id) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:published_at) }
    it { is_expected.to validate_presence_of(:height) }
    it { is_expected.to validate_presence_of(:width) }
    it { is_expected.to validate_presence_of(:depth) }
    it { is_expected.to validate_presence_of(:materials) }

    it { is_expected.to validate_length_of(:title).is_at_most(described_class::TITLE_MAX_LENGTH) }
    it { is_expected.to validate_length_of(:description).is_at_most(described_class::DESCRIPTION_MAX_LENGTH) }

    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:height).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:width).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:depth).is_greater_than(0) }
  end
end
