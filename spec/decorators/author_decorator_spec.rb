RSpec.describe AuthorDecorator do
  let(:first_name) { FFaker::Name.first_name }
  let(:last_name) { FFaker::Name.last_name }
  let(:author) { build(:author, first_name: first_name, last_name: last_name).decorate }

  describe '#full_name' do
    context 'when call method' do
      let(:full_name_result) { "#{first_name} #{last_name}" }

      it { expect(author.full_name).to eq(full_name_result) }
    end
  end
end
