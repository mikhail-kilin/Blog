module AdminScope
  class ArticlesController < BaseController
    before_action :set_article, only: %i[show edit update]

    def show
      authenticate_user! unless @article_policy.show?
    end

    def new
      @article = Article.new
    end

    def edit
    end

    def create
      @article = Article.new(article_params)

      if @article.save
        redirect_to [:admin_scope, @article], notice: "Article was successfully created."
      else
        render :new
      end
    end

    def update
      if @article.update(article_params)
        redirect_to [:admin_scope, @article], notice: "Article was successfully updated."
      else
        render :edit
      end
    end

    private

    def set_article
      @article = Article.find(params[:id])
      @article_policy = ArticlePolicy.new @article, current_user
    end

    def article_params
      params.require(:article).permit(:title, :content, :status)
    end
  end
end
