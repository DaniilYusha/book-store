RSpec.describe ReviewForm, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_presence_of(:rating) }
    it { is_expected.to validate_length_of(:title).is_at_most(described_class::TITLE_MAX_LENGTH) }
    it { is_expected.to validate_length_of(:text).is_at_most(described_class::TEXT_MAX_LENGTH) }
    it { is_expected.to validate_numericality_of(:rating).is_less_than_or_equal_to(ReviewForm::RATING_RANGE.last) }
  end
end
