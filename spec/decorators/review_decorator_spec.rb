RSpec.describe ReviewDecorator do
  let(:review) { build(:review, created_at: '2020-09-15').decorate }

  describe '#creation_date' do
    it 'returns date in format d/m/y' do
      expect(review.creation_date).to eq('15/09/20')
    end
  end
end
