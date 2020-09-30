RSpec.describe BookDecorator do
  let(:book) { build(:book, published_at: '2020-09-15').decorate }

  it 'returns authors list' do
    expect(book.authors_list).to eq(
      book.authors.map { |author| author.first_name.concat(' ', author.last_name) }.join ', '
    )
  end

  it 'returns the published at date' do
    expect(book.published_at).to eq(2020)
  end

  it 'returns book materials' do
    expect(book.materials_list).to eq book.materials.map(&:name).join(', ').capitalize
  end

  it 'returns dimensions' do
    expect(book.dimensions).to eq([
      book.height.to_s.insert(0, 'H:'),
      book.width.to_s.insert(0, 'W:'),
      book.depth.to_s.insert(0, 'D:')
    ].join '" x ')
  end

  it 'returns short description' do
    expect(book.short_description).to eq(
      book.description.truncate(described_class::SHORT_DESCRIPTION_LENGTH)
    )
  end
end
