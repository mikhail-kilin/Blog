module AdminScope
  class ArticlesController < BaseController
    before_action -> { authorize article }, except: :index

    expose_decorated :article
    expose :article_policy, -> { set_article_policy }
    expose :articles, -> { set_articles }

    def index
    end

    def show
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "Article | #{article.title}",
                 page_size: "A4"
        end
      end
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

    def destroy
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

    def set_articles
      Article.editable(current_user).sorted_by_create_time.page(params[:page])
    end
  end
end
