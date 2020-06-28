class ArticlesController < ApplicationController
  expose_decorated :article
  expose :comment, -> { set_comment }
  expose_decorated :company, -> { article.company }

  layout "company"

  def show
    authorize article
  end

  private

  def articles
    Article.published.sorted.page params[:page]
  end

  def set_comment
    article.comments.new
  end
end
