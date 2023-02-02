RSpec.describe CompletePresenter do
  describe '#completed_order' do
    let(:order) { create(:order, status: Order.statuses[:complete]) }
    let(:presenter_execution) { described_class.new(user: order.user).completed_order }

    it { expect(presenter_execution).to eq(order.decorate) }
  end
end
