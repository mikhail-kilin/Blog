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
      Author.from_list company.authors, company
    end

    def filter_authors
      articles = params[:search][:articles]
      comments = params[:search][:comments]
      set_by_comments set_by_articles(authors, articles), comments
    end

    def set_by_articles(authors, articles)
      authors.select do |item|
        articles == "present" && item.count_of_articles != 0 ||
          articles == "empty" && item.count_of_articles.zero? ||
          articles == "all"
      end
    end

    def set_by_comments(authors, comments)
      authors.select do |item|
        comments == "present" && item.count_of_comments != 0 ||
          comments == "empty" && item.count_of_comments.zero? ||
          comments == "all"
      end
    end
  end
end
