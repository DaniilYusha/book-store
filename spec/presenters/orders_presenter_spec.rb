RSpec.describe OrdersPresenter do
  subject { described_class.new }

  let(:order) { create(:order, status: status) }

  describe '#add_class_for_status' do
    context 'when order has delivered status' do
      let(:status) { Order.statuses[:delivered] }

      it 'returns css class for delivered status' do
        expect(subject.add_class_for_status(order)).to eq(described_class::DELIVERED_STATUS_CLASS)
      end
    end

    context 'when order has not delivered status' do
      let(:status) { Order.statuses[:complete] }

      it 'returns css class for not delivered status' do
        expect(subject.add_class_for_status(order)).to eq(described_class::OTHER_STATUSES_CLASS)
      end
    end
  end
end
