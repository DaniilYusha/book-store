RSpec.describe BookForm, type: :model do
  context 'with validations' do
    it { is_expected.to validate_length_of(:title).is_at_most(described_class::TITLE_MAX_LENGTH) }
    it { is_expected.to validate_length_of(:description).is_at_most(described_class::DESCRIPTION_MAX_LENGTH) }

    %i[category_id title description price published_at height width depth materials].each do |field|
      it { is_expected.to validate_presence_of(field) }
    end

    %i[price height width depth].each do |field|
      it { is_expected.to validate_numericality_of(field).is_greater_than(0) }
    end
  end
end
