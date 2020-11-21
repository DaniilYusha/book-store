RSpec.describe AuthorDecorator do
  let(:author) { create(:author, first_name: 'Daniil', last_name: 'Yusha').decorate }

  it '#full_name' do
    expect(author.full_name).to eq('Daniil Yusha')
  end
end
