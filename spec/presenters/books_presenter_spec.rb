RSpec.describe BooksPresenter do
  describe '#books_count' do
    let_it_be(:book) { create(:book) }

    it { expect(described_class.new.books_count).to eq(1) }
  end

  describe '#calculate_limit' do
    context 'when parameter is nil' do
      let(:result) { 12 }

      it 'returns an integer' do
        expect(described_class.new.calculate_limit.class).to eq(Integer)
      end

      it 'returns 12' do
        expect(described_class.new.calculate_limit).to eq(result)
      end
    end

    context 'when parameter is a number' do
      let(:current_books_count) { 2 }
      let(:result) { 14 }

      it 'returns an integer' do
        expect(described_class.new(current_books_count).calculate_limit.class).to eq(Integer)
      end

      it 'returns 14' do
        expect(described_class.new(current_books_count).calculate_limit).to eq(result)
      end
    end
  end
end
