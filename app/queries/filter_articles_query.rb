class FilterArticlesQuery
  attr_reader :articles, :params

  def initialize(articles, params)
    @articles = articles
    @params = params
  end

  def all
    @articles = articles.search_by_data(params[:data]) if search?
    articles
  end

  private

  def search?
    params[:data].present?
  end
end
  