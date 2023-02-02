RSpec.describe DeliveryPresenter do
  let(:delivery) { create(:delivery) }
  let(:order) { create(:order, delivery: delivery) }

  describe '#deliveries' do
    let(:presenter_execution) { described_class.new.deliveries }

    it { expect(presenter_execution).to eq(Delivery.all) }
  end

  describe '#check_delivery' do
    context 'when delivery id in order is equal to showed delivery id with zero index' do
      let(:index) { 0 }
      let(:presenter_execution) do
        described_class.new.check_delivery(order: order, delivery: delivery, delivery_index: index)
      end

      it 'returns true' do
        expect(presenter_execution).to eq(true)
      end
    end

    context 'when delivery id in order is not equal to showed delivery id with zero index' do
      let(:index) { 0 }
      let(:presenter_execution) do
        described_class.new.check_delivery(order: nil, delivery: delivery, delivery_index: index)
      end

      it 'returns true' do
        expect(presenter_execution).to eq(true)
      end
    end

    context 'when delivery id in order is equal to showed delivery id with not zero index' do
      let(:index) { 1 }
      let(:presenter_execution) do
        described_class.new.check_delivery(order: order, delivery: delivery, delivery_index: index)
      end

      it 'returns true' do
        expect(presenter_execution).to eq(true)
      end
    end

    context 'when delivery id in order is not equal to showed delivery id with not zero index' do
      let(:index) { 1 }
      let(:presenter_execution) do
        described_class.new.check_delivery(order: nil, delivery: delivery, delivery_index: index)
      end

      it 'returns false' do
        expect(presenter_execution).to eq(false)
      end
    end
  end
end
