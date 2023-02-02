class ConfirmPresenter
  def initialize(user: nil)
    @user = user
  end

  private

  attr_reader :user
end
