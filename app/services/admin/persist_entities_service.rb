module Admin
  class PersistEntitiesService
    attr_reader :errors

    ENTITIES = {
      author: Author,
      book: Book,
      category: Category
    }.freeze

    def initialize(entity:, params:)
      @entity_class = ENTITIES[entity]
      @id = params[:id]
      @params = params[ENTITIES.key(@entity_class)]
      @form = "#{@entity_class}Form".constantize.new(@params)
      @errors = {}
    end

    def call
      return persist_entity if form.valid?

      @errors = form.errors
      false
    end

    private

    attr_reader :entity_class, :id, :params, :form

    def persist_entity
      id.nil? ? entity_class.create(params) : entity_class.find_by(id: id).update(params)
    end
  end
end
