module AdminScope
  class CompaniesController < BaseController
    before_action -> { authorize company }, only: %i[edit update new create]

    expose_decorated :company, find_by: :slug

    def show
    end

    def new
    end

    def edit
    end

    def create
      company.owner = current_user
      company.save

      respond_with :admin_scope, company
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
