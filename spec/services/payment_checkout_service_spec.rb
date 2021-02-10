RSpec.describe PaymentCheckoutService do
  let(:order_item) { create(:order_item) }
  let(:order) { create(:order, order_items: [order_item]) }

  describe '#call' do
    subject(:execute_service) { described_class.new(params: params, user: order.user, order: order).call }

    context 'with valid params' do
      let(:params) { { credit_card: card_params } }
      let(:card_params) { attributes_for(:credit_card) }

      it 'returns true' do
        expect(execute_service).to eq(true)
      end

      it 'creates new credit card' do
        expect { execute_service }.to change(CreditCard, :count).by(1)
      end
    end

    context 'with invalid params' do
      let(:params) { { credit_card: card_params } }
      let(:card_params) { attributes_for(:credit_card, cvv: '') }

      it 'returns false' do
        expect(execute_service).to eq(false)
      end

      it 'does not create new credit card' do
        expect { execute_service }.not_to change(CreditCard, :count)
      end
    end
  end
end
