class OrderMailer < ApplicationMailer
  MAIL_FROM = 'bookstore@example.com'.freeze

  default from: MAIL_FROM

  def thank_for_order(email)
    mail(to: email, body: I18n.t('checkout.confirm.thank_for_order'))
  end
end
