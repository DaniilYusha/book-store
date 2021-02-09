class PaymentPresenter
  ERROR_CLASS = 'has-error'.freeze

  attr_reader :errors

  def initialize(user: nil, errors: {})
    @user = user
    @errors = errors
  end

  def add_error_class_for_field(field)
    ERROR_CLASS if field_has_errors?(field)
  end

  def field_has_errors?(field)
    errors.any? && errors.messages.key?(field)
  end

  private

  attr_reader :user
end
