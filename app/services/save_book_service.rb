class SaveBookService
  attr_reader :errors

  def initialize(params)
    @id = params[:id]
    @params = params[:book]
    @form = BookForm.new(@params)
    @errors = []
  end

  def call
    book = Book.find_by(id: id) || Book.new
    form.valid? ? book.update(params) : @errors = form.errors
  end

  private

  attr_reader :id, :params, :form
end
