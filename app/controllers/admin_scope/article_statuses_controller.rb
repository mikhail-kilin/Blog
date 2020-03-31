module AdminScope
  class ArticleStatusesController < BaseController
    expose :article

    def update
      article = Article.find(params[:id])
      article.update(article_params)
      redirect_to admin_scope_articles_path, notice: "Article status is #{params[:status]}"
    end

    private

    def article_params
      params.permit(:status)
    end
  end
end
