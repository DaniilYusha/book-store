class DeliveryCheckoutService
  def initialize(params:, user:, order:)
    @params = params
    @user = user
    @order = order
  end

  def call
    order.update(delivery_id: params[:delivery_id])
  end

  def presenter
    DeliveryPresenter.new
  end

  private

  attr_reader :params, :user, :order
end
