class CheckoutUpdateService
  attr_reader :presenter

  SERVICES = {
    address: AddressCheckoutService,
    delivery: DeliveryCheckoutService
  }

  STEPS = {
    address: ->(order) { order.delivery! },
    delivery: ->(order) { order.payment! },
    payment: ->(order) { order.confirm! },
    confirm: ->(order) { order.complete! }
  }

  def initialize(params:, user:, order:)
    @params = params
    @user = user
    @order = order
  end

  def call
    service = SERVICES[params[:step].to_sym].new(params: params, user: user, order: order)
    return true if service.call

    @presenter = service.presenter
    false
  end

  def next_step
    STEPS[params[:step].to_sym].call(order)
    order.status
  end

  private

  attr_reader :params, :user, :order
end
