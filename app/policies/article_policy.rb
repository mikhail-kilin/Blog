class ArticlePolicy
  def new?
    manage?
  end

  def create?
    manage?
  end

  def edit?
    manage?
  end

  def update?
    manage?
  end

  def manage?
    user_signed_in?
  end
end
