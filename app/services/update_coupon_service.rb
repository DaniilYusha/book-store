class UpdateCouponService
  attr_reader :errors

  def initialize(params, cart)
    @coupon_form = CouponForm.new(params)
    @cart = cart
  end

  def call
    if coupon_form.invalid?
      @errors = coupon_form.errors
    else
      coupon = Coupon.find_by(code: coupon_form.attributes[:code])
      coupon.update(cart: cart)
    end

    errors.blank?
  end

  private

  attr_reader :cart, :coupon_form
end
