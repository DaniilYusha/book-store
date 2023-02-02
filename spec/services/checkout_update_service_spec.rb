RSpec.describe CheckoutUpdateService do
  let(:order_item) { create(:order_item) }
  let(:order) { create(:order, order_items: [order_item]) }

  describe '#call' do
    subject(:execute_service) { described_class.new(params: params, user: order.user, order: order).call }

    context 'when step is address and params are valid' do
      let(:params) { { step: step, address: address_params } }
      let(:step) { :address }
      let(:address_params) do
        { billing_form: attributes_for(:address), shipping_form: attributes_for(:address, address_type: :shipping) }
      end

      it 'returns true' do
        expect(execute_service).to eq(true)
      end

      it 'creates billing and shipping addresses for user' do
        expect { execute_service }.to change(Address, :count).by(2)
      end
    end

    context 'when step is address and params are invalid' do
      let(:params) { { step: step, address: address_params } }
      let(:step) { :address }
      let(:address_params) do
        { billing_form: attributes_for(:address, city: ''),
          shipping_form: attributes_for(:address, address_type: :shipping) }
      end

      it 'returns false' do
        expect(execute_service).to eq(false)
      end

      it 'does not create billing and shipping addresses for user' do
        expect { execute_service }.not_to change(Address, :count)
      end
    end

    context 'when step is delivery' do
      let(:params) { { step: step, delivery_id: delivery.id } }
      let(:step) { :delivery }
      let(:delivery) { create(:delivery) }

      it 'returns true' do
        expect(execute_service).to eq(true)
      end

      it 'sets delivery_id for order' do
        expect { execute_service }.to change(order.reload, :delivery_id)
      end
    end

    context 'when step is payment and params are valid' do
      let(:params) { { step: step, credit_card: card_params } }
      let(:step) { :payment }
      let(:card_params) { attributes_for(:credit_card) }

      it 'returns true' do
        expect(execute_service).to eq(true)
      end

      it 'creates credit card for order' do
        expect { execute_service }.to change(CreditCard, :count).by(1)
      end
    end

    context 'when step is confirm' do
      let(:params) { { step: step } }
      let(:step) { :confirm }

      it 'returns true' do
        expect(execute_service).to eq(true)
      end

      it 'creates credit card for order' do
        expect { execute_service }.to change(order.reload, :number)
      end
    end
  end
end
