class ArticlesController < ApplicationController
  expose_decorated :article
  expose :articles
  expose :article_policy, -> { set_article_policy }

  def show
    authenticate_user! unless @article_policy.show?
  end

  def index
  end

  private

  def set_article_policy
    ArticlePolicy.new current_user, article
  end

  def articles
    Article.published.sorted.page params[:page]
  end
end


