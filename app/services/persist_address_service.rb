class PersistAddressService
  attr_reader :errors

  def initialize(user:, params:)
    @user = user
    @form = AddressForm.new(params)
    @params = params.merge(addressable: user)
    @errors = {}
  end

  def call
    form.valid? ? save_address : @errors = form.errors

    errors.blank?
  end

  private

  attr_reader :user, :params, :form

  def address
    @address ||= Address.find_by(addressable_id: user.id, address_type: params[:address_type])
  end

  def save_address
    address.nil? ? Address.create(params) : address.update(params)
  end
end
