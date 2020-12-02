class SaveCategoryService
  attr_reader :errors

  def initialize(params)
    @id = params[:id]
    @params = params[:category]
    @form = CategoryForm.new(@params)
    @errors = []
  end

  def call
    category = Category.find_by(id: id) || Category.new
    form.valid? ? category.update(params) : @errors = form.errors
  end

  private

  attr_reader :id, :params, :form
end
