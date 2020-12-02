module Admin
  class SaveEntitiesService
    attr_reader :errors

    ENTITIES = { author: Author, book: Book, category: Category }.freeze

    def initialize(entity:, params:)
      @entity_class = ENTITIES[entity]
      @id = params[:id]
      @params = params[ENTITIES.key(@entity_class)]
      @errors = []
    end

    def call
      form = "#{entity_class}Form".constantize.new(params)
      entity = entity_class.find_by(id: id) || entity_class.new
      form.valid? ? entity.update(params) : @errors = form.errors
    end

    private

    attr_reader :entity_class, :id, :params
  end
end
