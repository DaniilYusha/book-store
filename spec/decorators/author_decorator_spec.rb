RSpec.describe AuthorDecorator do
  let(:author) { create(:author, first_name: 'Daniil', last_name: 'Yusha').decorate }
  let(:full_name_result) { 'Daniil Yusha' }

  it '#full_name' do
    expect(author.full_name).to eq(full_name_result)
  end
end
