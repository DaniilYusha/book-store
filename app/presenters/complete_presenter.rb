class CompletePresenter
  def initialize(user: nil)
    @user = user
  end

  def completed_order
    @completed_order ||= user.orders.complete.last.decorate
  end

  private

  attr_reader :user
end
