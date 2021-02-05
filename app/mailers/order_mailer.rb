class OrderMailer < ApplicationMailer
  default from: 'bookstore@example.com'

  def thank_for_order(email)
    mail(to: email, body: I18n.t('checkout.confirm.thank_for_order'))
  end
end
