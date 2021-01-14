class QuickRegistrationPresenter
  attr_reader :errors

  def initialize(errors:)
    @errors = errors.full_messages_for(:email).to_sentence
  end
end
