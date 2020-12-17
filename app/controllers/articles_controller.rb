class ArticlesController < ApplicationController
  expose_decorated :article, -> { set_article }
  expose :comment, -> { set_comment }
  expose_decorated :company, -> { article.company }
  expose :rating, -> { set_rating }

  layout "company"

  def show
    authorize article
  end

  private

  def set_article
    Article.includes(:comments, :ratings).find_by(id: params["id"])
  end

  def set_comment
    article.comments.new
  end

  def set_rating
    Rating.find_or_initialize_by(article: article, user: current_user)
  end
end
