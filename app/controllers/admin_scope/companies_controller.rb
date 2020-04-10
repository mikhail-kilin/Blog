module AdminScope
  class CompaniesController < BaseController
    expose :company, find_by: :slug

    def show
    end

    def new
    end

    def edit
    end

    def create
      company.save

      respond_with company, location: admin_scope_company_path(company)
    end

    def update
      company.update(company_params)

      respond_with company, location: admin_scope_company_path(company)
    end

    private

    def company_params
      params.require(:company).permit(:name, :slug, :image)
    end
  end
end
