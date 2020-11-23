module AdminScope
  class CompanyRegistrationsController < BaseController
    expose :company, find_by: :slug

    def update
      authorize company, :become_to_author?
      company.authors.push current_user
      redirect_back fallback_location: companies_path, notice: "Now you became an author"
    end
  end
end
