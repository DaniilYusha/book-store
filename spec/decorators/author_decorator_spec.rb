RSpec.describe AuthorDecorator do
  let(:first_name) { 'Daniil' }
  let(:last_name) { 'Yusha' }
  let(:author) { build(:author, first_name: first_name, last_name: last_name).decorate }
  let(:full_name_result) { 'Daniil Yusha' }

  it '#full_name' do
    expect(author.full_name).to eq(full_name_result)
  end
end
