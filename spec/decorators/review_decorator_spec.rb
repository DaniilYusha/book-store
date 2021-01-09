RSpec.describe ReviewDecorator do
  let(:review) { build(:review).decorate }

  describe '#creation_date' do
    let(:creation_date_result) { review.created_at.strftime('%d/%m/%y') }

    it 'returns date in format d/m/y' do
      expect(review.creation_date).to eq(creation_date_result)
    end
  end
end
