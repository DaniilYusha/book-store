class UpdateOrderItemService
  attr_reader :errors

  def initialize(id:, params:)
    @id = id
    @params = params
    @errors = []
  end

  def call
    item ? update_item : add_error(I18n.t('alert.something_wrong'))

    errors.empty?
  end

  private

  attr_reader :id, :params

  def item
    @item ||= OrderItem.find_by(id: id)
  end

  def update_item
    return add_error(I18n.t('alert.wrong_quantity')) unless valid_quantity?

    item_saved?
  end

  def item_saved?
    add_error(I18n.t('alert.something_wrong')) unless item.save
  end

  def valid_quantity?
    change_item_quantity.quantity.positive?
  end

  def change_item_quantity
    params[:increment] ? item.increment(:quantity) : item.decrement(:quantity)
  end

  def add_error(error)
    @errors << error
  end
end
