class CouponsController < ApplicationController
  def update
    service = UpdateCouponService.new(coupon_params, current_order)
    result = service.call ? :notice : :alert
    flash[result] = service.errors.any? ? service.errors.full_messages.to_sentence : I18n.t('notice.coupon.apply')
    redirect_to(cart_path)
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end
