RSpec.describe DeliveryCheckoutService do
  let(:order_item) { create(:order_item) }
  let(:order) { create(:order, order_items: [order_item]) }

  describe '#call' do
    subject(:execute_service) { described_class.new(params: params, user: order.user, order: order).call }

    let(:delivery) { create(:delivery) }
    let(:params) { { delivery_id: delivery.id } }

    it 'sets delivery id to order' do
      expect { execute_service }.to change(order.reload, :delivery_id)
    end

    it 'delivery_id in order is equals to delivery id' do
      execute_service
      expect(order.reload.delivery_id).to eq(delivery.id)
    end
  end
end
