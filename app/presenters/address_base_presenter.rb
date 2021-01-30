class AddressBasePresenter
  def initialize(user:, params: {})
    @user = user
    @params = params
  end

  def billing_address
    user.billing_address || Address.new()
  end

  def shipping_address
    user.shipping_address || Address.new()
  end

  def countries
    @countries ||= ISO3166::Country.all.sort_by(&:name)
  end

  private

  attr_reader :user, :params
end
