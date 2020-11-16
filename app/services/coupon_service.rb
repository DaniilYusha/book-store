class CouponService
  attr_reader :errors

  def initialize(code, cart)
    @code = code
    @cart = cart
    @errors = []
  end

  def call
    coupon = Coupon.find_by(code: @code)
    check_coupon(coupon)
    @cart.update(coupon: coupon) if @errors.empty?
  end

  private

  def check_coupon(coupon)
    @errors << I18n.t('alert.coupon.not_exist') if coupon.nil?
    @errors << I18n.t('alert.coupon.used') if coupon.cart.present?
    @errors << I18n.t('alert.coupon.invalid') unless coupon.is_valid
  end
end
