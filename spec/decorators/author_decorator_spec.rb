RSpec.describe AuthorDecorator do
  let(:author) { create(:author, first_name: 'Daniil', last_name: 'Yusha').decorate }

  it '#name' do
    expect(author.name).to eq('Daniil Yusha')
  end
end
