class OrderItemPolicy < ApplicationPolicy
  def edit?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def new?
    true
  end

  def create?
    true
  end
end
