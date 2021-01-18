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
    errors.add(:code, I18n.t('alert.coupon.not_exist')) unless coupon
  end

  def coupon_is_used
    errors.add(:code, I18n.t('alert.coupon.used')) if coupon.order
  end

  def coupon_is_invalid
    errors.add(:code, I18n.t('alert.coupon.invalid')) unless coupon.is_valid
  end
end
