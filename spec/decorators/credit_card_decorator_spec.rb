RSpec.describe CreditCardDecorator do
  let(:card) { build(:credit_card).decorate }

  describe '#masked_number' do
    let(:result) do
      CreditCardDecorator::HIDDEN_CARD_NUMBERS + card.number.last(CreditCardDecorator::NUMBERS_COUNT_TO_SHOW)
    end

    it { expect(card.masked_number).to eq(result) }
  end
end
