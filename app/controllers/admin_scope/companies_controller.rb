module AdminScope
  class CompaniesController < BaseController
    expose :company, find_by: :slug
    expose :company_policy, -> { set_company_policy }

    def show
    end

    def new
      redirect_to admin_scope_company_path current_user.own_company unless company_policy.new?
    end

    def edit
      redirect_to admin_scope_company_path company unless company_policy.edit?
    end

    def create
      redirect_to admin_scope_company_path current_user.own_company and return unless company_policy.create?
      company.owner = current_user
      company.save

      respond_with :admin_scope, company
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
