module AdminScope
  class ArticleStatusesController < BaseController
    def update
      @article = Article.find(params[:id])
      @article.update(article_params)
      redirect_to [:admin_scope, @article], notice: "Article status is #{params[:status]}"
    end

    private

    def article_params
      params.permit(:status)
    end
  end
end
