class OrdersPresenter
  def add_class_for_status(order)
    order.status == :delivered.to_s ? 'text-success' : 'in-grey-900'
  end
end
