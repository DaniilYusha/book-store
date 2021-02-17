RSpec.describe PaymentPresenter do
  let(:card_form) { CreditCardForm.new(card_params) }

  before { card_form.validate }

  describe '#field_has_errors?' do
    context 'when field has error' do
      let(:card_params) { attributes_for(:credit_card, number: '') }
      let(:presenter_execution) { described_class.new(errors: card_form.errors).field_has_errors?(:number) }

      it 'returns true' do
        expect(presenter_execution).to eq(true)
      end
    end

    context 'when fields without errors' do
      let(:card_params) { attributes_for(:credit_card) }
      let(:presenter_execution) { described_class.new(errors: card_form.errors).field_has_errors?(:name) }

      it 'returns false' do
        expect(presenter_execution).to eq(false)
      end
    end
  end

  describe '#add_error_class_for_field' do
    context 'when field has error' do
      let(:card_params) { attributes_for(:credit_card, cvv: '') }
      let(:presenter_execution) { described_class.new(errors: card_form.errors).add_error_class_for_field(:cvv) }

      it 'returns error class for css' do
        expect(presenter_execution).to eq(described_class::ERROR_CLASS)
      end
    end

    context 'when fields without errors' do
      let(:card_params) { attributes_for(:credit_card) }
      let(:presenter_execution) { described_class.new(errors: card_form.errors).add_error_class_for_field(:cvv) }

      it 'returns error class for css' do
        expect(presenter_execution).to be_nil
      end
    end
  end
end
