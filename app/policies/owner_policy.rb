class OwnerPolicy
  attr_reader :user, :owner

  def initialize(user, owner)
    @user = user
    @owner = owner
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  def destroy?
    false
  end
end
