module AdminScope
  class CompanyRegistrationsController < BaseController
    expose :company, find_by: :slug
    expose :company_policy, -> { set_company_policy }

    def update
      redirect_to company_path company and return unless company_policy.become_to_author?
      company.authors.push current_user
      redirect_back fallback_location: companies_path, notice: "Now you became an author"
    end

    private

    def set_company_policy
      CompanyPolicy.new(current_user, company)
    end
  end
end
