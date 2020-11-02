class CompaniesController < ApplicationController
  expose_decorated :company, find_by: :slug
  expose_decorated :companies, -> { set_companies }
  expose_decorated :articles, :sorted_articles

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
    Company.sorted_by_updated_time.page params[:page]
  end

  def sorted_articles
    filtered_articles.sorted_by_update_time
  end

  def filtered_articles
    FilterArticlesQuery.new(raw_relation, filter_params).all
  end

  def raw_relation
    company.articles.published.page(params[:page]).per(10)
  end

  def filter_params
    params.fetch(:search, {}).permit(:data)
  end
end
