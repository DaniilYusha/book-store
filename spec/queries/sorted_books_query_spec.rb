RSpec.describe SortedBooksQuery do
  CATEGORIES_COUNT = 3

  let(:categories) { create_list(:category_with_books, CATEGORIES_COUNT) }
  let(:category) { categories.first }
  let(:parameters_list_without_category_id) do
    {
      sort: 'title',
      direction: 'asc'
    }
  end

  let(:full_parameters_list) do
    {
      category_id: category.id,
      sort: 'title',
      direction: 'asc'
    }
  end

  let(:parameters_sorted_by_price_asc) do
    {
      category_id: category.id,
      sort: 'price',
      direction: 'asc'
    }
  end

  let(:parameters_sorted_by_price_desc) do
    {
      category_id: category.id,
      sort: 'price',
      direction: 'desc'
    }
  end

  describe 'sorting books' do
    it 'returns all books' do
      expect(SortedBooksQuery.new(
        categories, parameters_list_without_category_id
      ).all.count).to eq 9
    end

    it 'returns books from category' do
      expect(SortedBooksQuery.new(
        categories, full_parameters_list
      ).all.count).to eq 3
    end

    it 'returns books sorted by price in asc direction' do
      expect(SortedBooksQuery.new(
        categories, parameters_sorted_by_price_asc
      ).all).to eq(category.books.sort_by { |book| book.price })
    end

    it 'returns books sorted by price in desc direction' do
      expect(SortedBooksQuery.new(
        categories, parameters_sorted_by_price_desc
      ).all).to eq(category.books.sort_by { |book| book.price }.reverse)
    end
  end
end
