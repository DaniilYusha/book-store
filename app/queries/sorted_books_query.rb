class SortedBooksQuery
  SORT_OPTIONS = %w[title price created_at].freeze

  def initialize(categories, params, relation = Book.with_authors)
    @params = params
    @relation = relation
    @categories = categories
  end

  def all
    @relation.where(category_id: category_parameter).order("#{sort_by} #{direction}")
  end

  private

  def category_parameter
    @params[:category_id] || @categories.map(&:id)
  end

  def sort_by
    @params[:sort].presence_in(SORT_OPTIONS) || 'title'
  end

  def direction
    @params[:direction] || 'asc'
  end
end
