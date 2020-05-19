module AdminScope
  class CompaniesController < BaseController
    before_action :new_check_policy, only: %i[new create]
    before_action -> { check_policy("admin_scope_company_path", "company") }, only: %i[edit update]

    expose :company, find_by: :slug
    expose :company_policy, -> { set_company_policy }

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

    def set_company_policy
      CompanyPolicy.new(current_user, company)
    end

    def company_params
      params.require(:company).permit(:name, :slug, :image)
    end

    def new_check_policy
      action_name = params[:action]
      own_company = current_user.own_company
      redirect_to admin_scope_company_path own_company and return unless company_policy.send("#{action_name}?")
    end
  end
end
