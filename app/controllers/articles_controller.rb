class ArticlesController < ApplicationController
  expose_decorated :article, -> { set_article }
  expose :comment, -> { set_comment }
  expose_decorated :company, -> { article.company }

  layout "company"

  def show
    authorize article
  end

  def set_article
    Article.includes(:comments).find_by(id: params["id"])
  end

  private

  def set_comment
    article.comments.new
  end
end
