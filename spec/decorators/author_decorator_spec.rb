RSpec.describe AuthorDecorator do
  let(:author) { build(:author, first_name: 'Daniil', last_name: 'Yusha').decorate }

  describe '#name' do
    it 'returns full author name' do
      expect(author.name).to eq 'Daniil Yusha'
    end
  end
end
