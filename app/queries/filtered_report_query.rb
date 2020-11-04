class FilteredReportQuery < BaseFilteredQuery
  ALLOWED_PARAMS = [:with_comments, :with_articles].freeze

  private

  def by_with_comments(relation, value)
    return relation if value.blank?

    return relation.with_comments if convert_to_boolean(value)
    relation.without_comments
  end

  def by_with_articles(relation, value)
    return relation if value.blank?

    return relation.with_articles if convert_to_boolean(value)
    relation.without_articles
  end
end
