RSpec.describe ConfirmCheckoutService do
  let(:order_item) { create(:order_item) }
  let(:order) { create(:order, order_items: [order_item]) }

  describe '#call' do
    subject(:execute_service) { described_class.new(params: params, user: order.user, order: order).call }

    context 'with generating order number' do
      let(:params) { { step: :confirm } }

      it 'change order number field' do
        expect { execute_service }.to change(order.reload, :number)
      end

      it 'returns ActionMailer::MailDeliveryJob object' do
        expect(execute_service).to be_kind_of(ActionMailer::MailDeliveryJob)
      end
    end
  end
end
