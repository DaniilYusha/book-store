class CouponForm
  include ActiveModel::Model
  include Virtus.model

  attribute :code, String

  validates :code, presence: true
  validate :coupon_is_not_exists
  validate :coupon_is_used, if: :coupon
  validate :coupon_is_invalid, if: :coupon

  private

  def coupon
    @coupon ||= Coupon.find_by(code: code)
  end

  def coupon_is_not_exists
    common(:not_exist, coupon)
  end

  def coupon_is_used
    common(:used, coupon.order.nil?)
  end

  def coupon_is_invalid
    common(:invalid, coupon.is_valid)
  end

  def common(inter_key, condition)
    errors.add(:code, I18n.t("alert.coupon.#{inter_key}")) unless condition
  end
end
