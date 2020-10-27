class CommentsController < ApplicationController
  before_action -> { authorize comment }

  expose :article, -> { set_article }
  expose :comment, build: ->(comment_params, scope) { comment_build comment_params, scope }

  def create
    comment.save
    respond_with comment, location: article_path(article)
  end

  def edit
  end

  def update
    comment.update(comment_params)
    respond_with comment, location: article_path(article)
  end

  def destroy
    article = comment.article
    comment.destroy
    redirect_to article_path article
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_article
    Article.find(params[:article_id])
  end

  def comment_build(thing_params, scope)
    comment = scope.new(thing_params)
    comment.article = article
    comment.user = current_user
    comment
  end
end
