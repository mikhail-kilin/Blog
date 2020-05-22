module AdminScope
  class ReportsController < BaseController
    expose :company, -> { current_user.own_company }
    expose :authors, -> { set_authors.sort }
    expose :filtered_authors, -> { filter_authors }

    def show
      redirect_back fallback_location: admin_scope_articles_path and return if company.blank?
    end

    def search
    end

    private

    def set_authors
      ReportQuery.new(company, "all", "all").send
    end

    def filter_authors
      articles = params[:search][:articles]
      comments = params[:search][:comments]
      ReportQuery.new(company, comments, articles).send
    end
  end
end
