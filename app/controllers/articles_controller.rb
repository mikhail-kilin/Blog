class ArticlesController < ApplicationController
  before_action :set_article, only: :show

  def show
    authenticate_user! unless @article_policy.show?
  end

  private

  def set_article
    @article = Article.find(params[:id])
    @article_policy = ArticlePolicy.new @article, current_user
  end
end
