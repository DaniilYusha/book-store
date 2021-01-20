class UpdateCouponService
  attr_reader :errors

  def initialize(params, order)
    @coupon_form = CouponForm.new(params)
    @order = order
    @errors = []
  end

  def call
    coupon_form.valid? ? coupon.update(order: order) : @errors = coupon_form.errors

    errors.empty?
  end

  private

  attr_reader :order, :coupon_form

  def coupon
    @coupon ||= Coupon.find_by(code: coupon_form.attributes[:code])
  end
end
