class CompaniesController < ApplicationController
  expose :company, find_by: :slug
  expose :companies, -> { set_companies }
  expose :company_policy, -> { set_company_policy }
  expose :articles, -> { set_articles }

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
    company.articles.published.sorted.page params[:page]
  end
end
