class CheckoutShowService
  PRESENTERS = {
    address: AddressCheckoutPresenter,
    delivery: DeliveryPresenter,
    payment: PaymentPresenter,
    confirm: ConfirmPresenter
  }.freeze

  def initialize(params:, user:, order:)
    @params = params
    @user = user
    @order = order
  end

  def call
    return if params[:step].to_sym == :login

    order.address! if order.pending?
    PRESENTERS[params[:step].to_sym].new(user: user)
  end

  private

  attr_reader :params, :user, :order
end
