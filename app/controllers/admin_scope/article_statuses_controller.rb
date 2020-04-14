module AdminScope
  class ArticleStatusesController < BaseController
    expose :article
    expose :article_policy, -> { set_article_policy }

    def update
      redirect_to admin_scope_articles_path and return unless article_policy.update?
      article.update(article_params)
      redirect_back fallback_location: admin_scope_articles_path, notice: "Article status is #{params[:status]}"
    end

    private

    def article_params
      params.permit(:status)
    end

    def set_article_policy
      ArticlePolicy.new(current_user, article)
    end
  end
end
