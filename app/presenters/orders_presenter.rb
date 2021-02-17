class OrdersPresenter
  DELIVERED_STATUS_CLASS = 'text-success'.freeze
  OTHER_STATUSES_CLASS = 'in-grey-900'.freeze

  def add_class_for_status(order)
    order.status == :delivered.to_s ? DELIVERED_STATUS_CLASS : OTHER_STATUSES_CLASS
  end
end
