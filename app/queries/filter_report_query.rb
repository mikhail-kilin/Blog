class FilterReportQuery
  AVAILABLE_COMMENT_FILTER = %w(all with_comments without_comments).freeze
  AVAILABLE_ARTICLE_FILTER = %w(all with_articles without_articles).freeze

  def initialize(company, comments_flag = "all", articles_flag = "all")
    @company = company
    @comments_flag = comments_flag if AVAILABLE_COMMENT_FILTER.include? comments_flag
    @articles_flag = articles_flag if AVAILABLE_ARTICLE_FILTER.include? articles_flag
  end

  def send
    @company.authors
    .send(@comments_flag)
    .send(@articles_flag)
    .order(:comments_count)
  end
end
