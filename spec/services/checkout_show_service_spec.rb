RSpec.describe CheckoutShowService do
  let(:order_item) { create(:order_item) }
  let(:order) { create(:order, order_items: [order_item]) }

  describe '#call' do
    context 'when step is login' do
      subject(:execute_service) { described_class.new(params: params, user: order.user, order: order).call }

      let(:params) { { step: :login } }

      it 'returns nil' do
        expect(execute_service).to be_nil
      end
    end

    context 'when step is address' do
      subject(:execute_service) { described_class.new(params: params, user: order.user, order: order).call }

      let(:params) { { step: :address } }

      it 'returns AddressCheckoutPresenter' do
        expect(execute_service.class).to eq(AddressCheckoutPresenter)
      end
    end

    context 'when step is delivery' do
      subject(:execute_service) { described_class.new(params: params, user: order.user, order: order).call }

      let(:params) { { step: :delivery } }

      it 'returns DeliveryPresenter' do
        expect(execute_service.class).to eq(DeliveryPresenter)
      end
    end

    context 'when step is payment' do
      subject(:execute_service) { described_class.new(params: params, user: order.user, order: order).call }

      let(:params) { { step: :payment } }

      it 'returns PaymentPresenter' do
        expect(execute_service.class).to eq(PaymentPresenter)
      end
    end

    context 'when step is confirm' do
      subject(:execute_service) { described_class.new(params: params, user: order.user, order: order).call }

      let(:params) { { step: :confirm } }

      it 'returns ConfirmPresenter' do
        expect(execute_service.class).to eq(ConfirmPresenter)
      end
    end

    context 'when step is complete' do
      subject(:execute_service) { described_class.new(params: params, user: order.user, order: order).call }

      let(:params) { { step: :complete } }

      it 'returns CompletePresenter' do
        expect(execute_service.class).to eq(CompletePresenter)
      end
    end
  end
end
