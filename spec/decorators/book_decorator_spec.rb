RSpec.describe BookDecorator do
  let(:author) { build(:author, first_name: 'Daniil', last_name: 'Yusha') }
  let(:book) {
    build(:book, published_at: '2020-09-15', price: 20, materials: 'wood paper',
          height: 5, width: 5, depth: 5, authors: [author]).decorate
  }

  it '#authors_list' do
    expect(book.authors_list).to eq('Daniil Yusha')
  end

  it '#price_with_currency' do
    expect(book.price_with_currency).to eq('€20.0')
  end

  it '#materials_list' do
    expect(book.materials_list).to eq('Wood, paper')
  end

  it '#dimensions' do
    expect(book.dimensions).to eq('H:5.0" x W:5.0" x D:5.0')
  end

  it '#short_description' do
    expect(book.short_description).to eq(
      book.description.truncate(described_class::SHORT_DESCRIPTION_LENGTH)
    )
  end
end
