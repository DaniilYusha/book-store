class SaveAuthorService
  attr_reader :errors

  def initialize(params)
    @id = params[:id]
    @params = params[:author]
    @form = AuthorForm.new(@params)
    @errors = []
  end

  def call
    author = Author.find_by(id: id) || Author.new
    form.valid? ? author.update(params) : @errors = form.errors
  end

  private

  attr_reader :id, :params, :form
end
