class FilteredArticlesQuery < BaseFilteredQuery
  ALLOWED_PARAMS = [:data].freeze

  private

  def by_data(relation, value)
    relation.search_by_data(value)
  end
end
