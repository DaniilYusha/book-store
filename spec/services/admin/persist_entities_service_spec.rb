RSpec.describe Admin::PersistEntitiesService do
  describe '#call' do
    context 'when save author with valid params' do
      let(:valid_author_params) { { author: attributes_for(:author) } }

      it 'returns new author' do
        expect(described_class.new(entity: :author, params: valid_author_params).call).to be true
      end
    end

    context 'when save author with invalid params' do
      let(:invalid_author_params) { { author: attributes_for(:author, first_name: '') } }

      it 'returns false' do
        expect(described_class.new(entity: :author, params: invalid_author_params).call).to be false
      end
    end

    context 'when save book with valid params' do
      let(:author) { create(:author) }
      let(:category) { create(:category) }
      let(:valid_book_params) { { book: attributes_for(:book, category_id: category.id, author_ids: [author.id]) } }

      it 'returns new book' do
        expect(described_class.new(entity: :book, params: valid_book_params).call).to be true
      end
    end

    context 'when save book with invalid params' do
      let(:invalid_book_params) { { book: attributes_for(:book) } }

      it 'returns new false' do
        expect(described_class.new(entity: :book, params: invalid_book_params).call).to be false
      end
    end

    context 'when save category with valid params' do
      let(:valid_category_params) { { category: attributes_for(:category) } }

      it 'returns new category' do
        expect(described_class.new(entity: :category, params: valid_category_params).call).to be true
      end
    end

    context 'when save category with invalid params' do
      let(:invalid_category_params) { { category: attributes_for(:category, name: '') } }

      it 'returns new category' do
        expect(described_class.new(entity: :category, params: invalid_category_params).call).to be false
      end
    end
  end
end
