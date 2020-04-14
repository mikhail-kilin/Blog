module AdminScope
  class ArticlesController < BaseController
    expose :article
    expose :article_policy, -> { set_article_policy }
    expose :articles, -> { Article.sorted_by_create_time.page(params[:page]) }
    expose :comment, -> { set_comment }

    def index
    end

    def show
      redirect_to admin_scope_articles_path unless article_policy.show?
    end

    def new
      redirect_to admin_scope_articles_path unless article_policy.new?
    end

    def edit
      redirect_to admin_scope_articles_path unless article_policy.edit?
    end

    def create
      redirect_to admin_scope_articles_path and return unless article_policy.create?
      article.user = current_user
      article.save

      respond_with :admin_scope, article
    end

    def update
      redirect_to admin_scope_articles_path and return unless article_policy.update?
      article.update(article_params)

      respond_with article, location: admin_scope_article_path(article)
    end

    def destroy
      redirect_to admin_scope_articles_path and return unless article_policy.destroy?
      article.destroy
      redirect_to admin_scope_articles_path, notice: "Article successfully removed"
    end

    private

    def set_article_policy
      ArticlePolicy.new(current_user, article)
    end

    def article_params
      params.require(:article).permit(:title, :content, :status, :company_id)
    end

    def set_comment
      article.comments.new
    end
  end
end
