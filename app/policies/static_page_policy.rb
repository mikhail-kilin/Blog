class StaticPagePolicy
  def initialize(user)
    @user = user
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

  def destroy?
    manage?
  end

  def manage?
    @user.present?
  end
end
