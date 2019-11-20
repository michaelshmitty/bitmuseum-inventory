class ItemPolicy
  attr_reader :user, :item

  def initialize(user, item)
    @user = user
    @item = item
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
    item.user == user
  end

  def update?
    item.user == user
  end

  def destroy?
    item.user == user
  end
end
