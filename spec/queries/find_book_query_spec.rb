RSpec.describe FindBookQuery do
  let!(:book) { create(:book) }

  describe '.call' do
    it 'returns book by id' do
      expect(described_class.call(book.id)).to eq(book)
    end
  end
end
