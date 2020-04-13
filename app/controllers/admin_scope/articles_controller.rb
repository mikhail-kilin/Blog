module AdminScope
  class ArticlesController < BaseController
    expose :article
    expose :article_policy, -> { set_article_policy }
    expose :articles, -> { Article.sorted_by_create_time.page(params[:page]) }

    def index
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
      article.user = current_user
      article.save

      respond_with :admin_scope, article
    end

    def update
      article.update(article_params)

      respond_with article, location: admin_scope_article_path(article)
    end

    private

    def set_article_policy
      ArticlePolicy.new(current_user, article)
    end

    def article_params
      params.require(:article).permit(:title, :content, :status, :company_id)
    end
  end
end
