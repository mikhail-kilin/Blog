module AdminScope
  class CompaniesController < BaseController
    expose :company, find_by: :slug
    expose :company_policy, -> { set_company_policy }

    def show
    end

    def new
    end

    def edit
      redirect_to admin_scope_company_path company unless company_policy.edit?
    end

    def create
      CompanyUser.create user: current_user, company: company if company.save

      respond_with company, location: admin_scope_company_path(company)
    end

    def update
      redirect_to admin_scope_company_path company and return unless company_policy.edit?
      company.update(company_params)

      respond_with company, location: admin_scope_company_path(company)
    end

    private

    def set_company_policy
      CompanyPolicy.new(current_user, company)
    end

    def company_params
      params.require(:company).permit(:name, :slug, :image)
    end
  end
end
