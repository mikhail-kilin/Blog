module AdminScope
  class ArticleStatusesController < BaseController
    before_action :check_policy

    expose :article
    expose :article_policy, -> { set_article_policy }

    def update
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
