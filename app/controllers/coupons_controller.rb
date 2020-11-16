class CouponsController < ApplicationController
  def check
    service = CouponService.new(coupon_params[:code], @cart)
    service.call
    service.errors.any? ? flash[:alert] = service.errors.first : flash[:notice] = I18n.t('notice.coupon.apply')
    redirect_to(cart_path(@cart))
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code).merge(cart_id: @cart.id)
  end
end
