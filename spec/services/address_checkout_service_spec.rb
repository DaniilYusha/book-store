RSpec.describe AddressCheckoutService do
  let(:order_item) { create(:order_item) }
  let(:order) { create(:order, order_items: [order_item]) }

  describe '#call' do
    subject(:execute_service) { described_class.new(params: params, user: order.user, order: order).call }

    context 'when valid params without use_billing_address' do
      let(:params) { { step: step, address: address_params } }
      let(:step) { :address }
      let(:address_params) do
        { billing_form: attributes_for(:address), shipping_form: attributes_for(:address, address_type: :shipping) }
      end

      it 'creates new billing and shipping addresses' do
        expect { execute_service }.to change(Address, :count).by(2)
      end
    end

    context 'when invalid params without use_billing_address' do
      let(:params) { { step: step, address: address_params } }
      let(:step) { :address }
      let(:address_params) do
        { billing_form: attributes_for(:address, city: ''),
          shipping_form: attributes_for(:address, address_type: :shipping) }
      end

      it 'does not create new billing and shipping addresses' do
        expect { execute_service }.not_to change(Address, :count)
      end

      it 'returns nil' do
        expect(execute_service).to be_nil
      end
    end

    context 'when valid params with use_billing_address' do
      let(:params) { { step: step, address: address_params, use_billing_address: true } }
      let(:step) { :address }
      let(:address_params) do
        { billing_form: attributes_for(:address), shipping_form: attributes_for(:address, address_type: :shipping) }
      end

      it 'creates new billing and shipping addresses' do
        expect { execute_service }.to change(Address, :count).by(2)
      end
    end

    context 'when invalid params with use_billing_address' do
      let(:params) { { step: step, address: address_params, use_billing_address: true } }
      let(:step) { :address }
      let(:address_params) do
        { billing_form: attributes_for(:address, city: ''),
          shipping_form: attributes_for(:address, address_type: :shipping) }
      end

      it 'does not create new billing and shipping addresses' do
        expect { execute_service }.not_to change(Address, :count)
      end

      it 'returns nil' do
        expect(execute_service).to be_nil
      end
    end
  end
end
