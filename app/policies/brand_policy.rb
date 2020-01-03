class BrandPolicy
  attr_reader :user, :brand

  def initialize(user, brand)
    @user = user
    @brand = brand
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
