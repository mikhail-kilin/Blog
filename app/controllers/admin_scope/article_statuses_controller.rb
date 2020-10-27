module AdminScope
  class ArticleStatusesController < BaseController
    before_action -> { authorize article }

    expose :article

    def update
      article.update(article_params)
      redirect_back fallback_location: admin_scope_articles_path, notice: "Article status is #{params[:status]}"
    end

    private

    def article_params
      params.permit(:status)
    end
  end
end
