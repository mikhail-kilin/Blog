class CompaniesController < ApplicationController
  expose_decorated :company, find_by: :slug
  expose_decorated :companies, -> { set_companies }
  expose :company_policy, -> { set_company_policy }
  expose_decorated :articles, -> { set_articles }

  layout "company", only: :show

  def index
  end

  def show
  end

  private

  def set_company_policy
    CompanyPolicy.new(current_user, company)
  end

  def company_params
    params.require(:company).permit(:name, :slug, :image)
  end

  def set_companies
    Company.sorted.page params[:page]
  end

  def set_articles
    articles = company.articles.published
    if params[:search] && params[:search][:data].present?
      articles = articles.search_by_data(params[:search][:data])
    end
    articles.sorted.page params[:page]
  end
end
