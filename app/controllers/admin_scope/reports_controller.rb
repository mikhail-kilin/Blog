module AdminScope
  class ReportsController < BaseController
    expose :company, -> { current_user.own_company }
    expose :authors, -> { set_authors }
    expose :filtered_authors, -> { filter_authors }

    def show
      redirect_back fallback_location: admin_scope_articles_path and return if company.blank?
    end

    def search
    end

    private

    def set_authors
      FilterReportQuery.new(company).send
    end

    def filter_authors
      articles = params[:search][:articles]
      comments = params[:search][:comments]
      FilterReportQuery.new(company, comments, articles).send
    end
  end
end
