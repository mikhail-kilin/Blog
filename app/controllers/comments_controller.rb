class CommentsController < ApplicationController
  expose :article, -> { set_article }
  expose :comment, build: ->(thing_params, scope) { comment_build thing_params, scope }
  expose :company_policy, -> { set_comment_policy }

  def create
    redirect_to article_path(article) and return unless company_policy.create?
    comment.save
    respond_with comment, location: article_path(article)
  end

  def edit
    redirect_to article_path(article) unless company_policy.edit?
  end

  def update
    redirect_to article_path(article) and return unless company_policy.update?
    comment.update(comment_params)
    respond_with comment, location: article_path(article)
  end

  def destroy
    redirect_to article_path(article) and return unless company_policy.destroy?
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

  def set_comment_policy
    CommentPolicy.new(current_user, comment)
  end

  def comment_build(thing_params, scope)
    comment = scope.new(thing_params)
    comment.article = article
    comment.user = current_user
    comment
  end
end
