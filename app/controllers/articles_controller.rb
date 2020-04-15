class ArticlesController < ApplicationController
  expose_decorated :article
  expose :article_policy, -> { set_article_policy }
  expose :comment, -> { set_comment }

  def show
    redirect_back fallback_location: companies_path unless article_policy.show?
  end

  private

  def set_article_policy
    ArticlePolicy.new current_user, article
  end

  def articles
    Article.published.sorted.page params[:page]
  end

  def set_comment
    article.comments.new
  end
end
