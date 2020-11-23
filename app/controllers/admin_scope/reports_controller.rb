module AdminScope
  class ReportsController < BaseController
    expose :company, -> { current_user.own_company }
    expose :authors, -> { filtered_authors.sorted_by_comments_count }

    def show
      redirect_back fallback_location: admin_scope_articles_path and return if company.blank?
    end

    def search
    end

    private

    def filtered_authors
      FilteredReportQuery.new(raw_authors, filter_params).all
    end

    def filter_params
      params.fetch(:report, {}).permit(:with_comments, :with_articles)
    end

    def raw_authors
      company.authors
    end
  end
end
