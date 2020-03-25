class ArticlesController < ApplicationController
  before_action :set_article, only: :show

  def index
    @articles = Article.where(status: "published").order(created_at: :desc).page params[:page]
  end

  def show
  end

  private

  def set_article
    @article = Article.find(params[:id])
    @article_policy = ArticlePolicy.new
  end
end
