class CompaniesController < ApplicationController
  expose_decorated :company, find_by: :slug
  expose_decorated :companies, -> { set_companies }
  expose_decorated :articles, -> { set_articles }

  layout "company", only: :show

  def index
  end

  def show
  end

  private

  def company_params
    params.require(:company).permit(:name, :slug, :image)
  end

  def set_companies
    Company.sorted.page params[:page]
  end

  def set_articles
    articles = company.articles.published
    articles = FilterArticlesQuery.new(articles, filter_params).send
    articles.sorted.page params[:page]
  end

  def filter_params
    params.fetch(:search, {}).permit(:data)
  end
end
