RSpec.describe 'admin/orders', type: :feature do
  let_it_be(:complete_order) { create(:order, status: Order.statuses[:complete]).decorate }
  let_it_be(:in_delivery_order) { create(:order, status: Order.statuses[:in_delivery]).decorate }
  let_it_be(:delivered_order) { create(:order, status: Order.statuses[:delivered]).decorate }
  let_it_be(:canceled_order) { create(:order, status: Order.statuses[:canceled]).decorate }
  let(:admin) { create(:admin_user) }

  before { login_as(admin) }

  describe '#index' do
    let(:index_page) { Pages::Admin::Orders::Index.new }

    before { index_page.load }

    context 'with page elements' do
      it { expect(index_page.main_content).to have_id_column }
      it { expect(index_page.main_content).to have_number_column }
      it { expect(index_page.main_content).to have_creation_date_column }
      it { expect(index_page.main_content).to have_status_column }
      it { expect(index_page.main_content).to have_complete_link }
      it { expect(index_page.main_content).to have_in_delivery_link }
      it { expect(index_page.main_content).to have_delivered_link }
      it { expect(index_page.main_content).to have_canceled_link }
    end

    context 'with complete orders' do
      before { index_page.main_content.complete_link.click }

      it { expect(index_page.main_content).to have_content(complete_order.id) }
      it { expect(index_page.main_content).to have_content(complete_order.number) }
      it { expect(index_page.main_content).to have_content(complete_order.creation_date) }
      it { expect(index_page.main_content).to have_content(complete_order.status) }
    end

    context 'with in_delivery orders' do
      before { index_page.main_content.in_delivery_link.click }

      it { expect(index_page.main_content).to have_content(in_delivery_order.id) }
      it { expect(index_page.main_content).to have_content(in_delivery_order.number) }
      it { expect(index_page.main_content).to have_content(in_delivery_order.creation_date) }
      it { expect(index_page.main_content).to have_content(in_delivery_order.status) }
    end

    context 'with delivered orders' do
      before { index_page.main_content.delivered_link.click }

      it { expect(index_page.main_content).to have_content(delivered_order.id) }
      it { expect(index_page.main_content).to have_content(delivered_order.number) }
      it { expect(index_page.main_content).to have_content(delivered_order.creation_date) }
      it { expect(index_page.main_content).to have_content(delivered_order.status) }
    end

    context 'with canceled orders' do
      before { index_page.main_content.canceled_link.click }

      it { expect(index_page.main_content).to have_content(canceled_order.id) }
      it { expect(index_page.main_content).to have_content(canceled_order.number) }
      it { expect(index_page.main_content).to have_content(canceled_order.creation_date) }
      it { expect(index_page.main_content).to have_content(canceled_order.status) }
    end
  end

  describe '#show' do
    let(:show_page) { Pages::Admin::Orders::Show.new }

    before { show_page.load(id: complete_order.id) }

    context 'with page elements' do
      it { expect(show_page.order_details).to have_number_row }
      it { expect(show_page.order_details).to have_creation_date_row }
      it { expect(show_page.order_details).to have_status_row }

      it { expect(show_page.actions).to have_in_delivery_button }
      it { expect(show_page.actions).to have_delivered_button }
      it { expect(show_page.actions).to have_canceled_button }

      it { expect(show_page.order_details.number_row).to have_content(complete_order.number) }
      it { expect(show_page.order_details.creation_date_row).to have_content(complete_order.creation_date) }
      it { expect(show_page.order_details.status_row).to have_content(complete_order.status) }
    end

    context 'when click in_delivery button' do
      let(:status) { :in_delivery }

      before { show_page.actions.in_delivery_button.click }

      it { expect(show_page.order_details.status_row).to have_content(status) }
      it { expect(show_page.actions).not_to have_in_delivery_button }
    end

    context 'when click delivered button' do
      let(:status) { :delivered }

      before { show_page.actions.delivered_button.click }

      it { expect(show_page.order_details.status_row).to have_content(status) }
      it { expect(show_page.actions).not_to have_delivered_button }
    end

    context 'when click canceled button' do
      let(:status) { :canceled }

      before { show_page.actions.canceled_button.click }

      it { expect(show_page.order_details.status_row).to have_content(status) }
      it { expect(show_page.actions).not_to have_canceled_button }
    end
  end
end
