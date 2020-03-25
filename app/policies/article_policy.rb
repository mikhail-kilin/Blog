class ArticlePolicy
  def initialize(article, user)
    @article = article
    @user = user
  end

  def show?
    manage? || @article.status == "published"
  end

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
    @user.present?
  end
end
