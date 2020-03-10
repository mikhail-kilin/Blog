class ArticlePolicy
  def can_use?
    user_signed_in?
  end
end
