RSpec.describe SortedOrdersQuery do
  let(:orders_count) { 2 }
  let(:user) { create(:user, orders: orders) }
  let(:orders) { create_list(:order, orders_count, status: orders_status) }

  describe '#call' do
    subject(:query_execution) { described_class.new(relation: user.orders, sort_by: sort_by).call }

    context 'without sort_by parameter' do
      let(:orders_status) { Order.statuses[:complete] }
      let(:sort_by) { nil }

      it 'returns all orders' do
        expect(query_execution).to eq(orders)
      end
    end

    context 'when sort_by is :complete' do
      let(:orders_status) { Order.statuses[:complete] }
      let(:sort_by) { :complete }

      it 'returns orders with complete status' do
        query_execution.each do |order|
          expect(order.status).to eq(sort_by.to_s)
        end
      end
    end

    context 'when sort_by is :in_delivery' do
      let(:orders_status) { Order.statuses[:in_delivery] }
      let(:sort_by) { :in_delivery }

      it 'returns orders with in_delivery status' do
        query_execution.each do |order|
          expect(order.status).to eq(sort_by.to_s)
        end
      end
    end

    context 'when sort_by is :delivered' do
      let(:orders_status) { Order.statuses[:delivered] }
      let(:sort_by) { :delivered }

      it 'returns orders with delivered status' do
        query_execution.each do |order|
          expect(order.status).to eq(sort_by.to_s)
        end
      end
    end

    context 'when sort_by is :canceled' do
      let(:orders_status) { Order.statuses[:canceled] }
      let(:sort_by) { :canceled }

      it 'returns orders with canceled status' do
        query_execution.each do |order|
          expect(order.status).to eq(sort_by.to_s)
        end
      end
    end
  end
end
