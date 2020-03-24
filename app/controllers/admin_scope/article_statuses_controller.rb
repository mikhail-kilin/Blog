module AdminScope
  class ArticleStatusesController < BaseController
    def update
      @article = Article.find(params[:id])
      status = if @article.status == "draft"
        "published"
      else
        "draft"
      end
      @article.update status: status
      redirect_to [:admin_scope, @article], notice: "Article status is #{status}"
    end
  end
end
