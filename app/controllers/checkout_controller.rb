class CheckoutController < ApplicationController
  def show
    service = CheckoutShowService.new(params: params, user: current_user, order: current_order)

    @presenter = service.call
    @order = current_order&.decorate
  end

  def update
    service = CheckoutUpdateService.new(params: params.permit!, user: current_user, order: current_order)
    return redirect_to checkout_path(step: service.next_step) if service.call

    @presenter = service.presenter
    @order = current_order.decorate
    render :show
  end
end
