class DeliveryPresenter
  def initialize(user: nil)
    @user = user
  end

  def deliveries
    Delivery.all
  end

  def check_delivery(order:, delivery:, delivery_index:)
    order&.delivery&.id == delivery.id || delivery_index.zero?
  end

  private

  attr_reader :user
end
