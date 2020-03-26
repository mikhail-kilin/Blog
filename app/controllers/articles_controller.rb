class ArticlesController < ApplicationController
  before_action :set_article, only: :show

  def show
    authenticate_user! unless @article_policy.show?
  end

  def index
    @articles = Article.where(status: "published").order(created_at: :desc).page params[:page]
  end

  private

  def set_article
    @article = Article.find(params[:id])
    @article_policy = ArticlePolicy.new current_user, @article
  end
end
