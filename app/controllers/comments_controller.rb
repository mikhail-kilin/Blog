class CommentsController < ApplicationController
  before_action :check_policy

  expose :article, -> { set_article }
  expose :comment, build: ->(thing_params, scope) { comment_build thing_params, scope }
  expose :company_policy, -> { set_comment_policy }

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

  def set_comment_policy
    CommentPolicy.new(current_user, comment)
  end

  def comment_build(thing_params, scope)
    comment = scope.new(thing_params)
    comment.article = article
    comment.user = current_user
    comment
  end

  def check_policy
    action_name = params[:action]
    redirect_to article_path(article) and return unless company_policy.send("#{action_name}?")
  end
end
