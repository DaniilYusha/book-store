class CreditCardDecorator < ApplicationDecorator
  delegate_all

  HIDDEN_CARD_NUMBERS = '**** **** **** '.freeze
  NUMBERS_COUNT_TO_SHOW = 4

  def masked_number
    HIDDEN_CARD_NUMBERS + object.number.chars.last(NUMBERS_COUNT_TO_SHOW).join
  end
end
