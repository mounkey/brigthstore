class CategoryPolicy < ApplicationPolicy
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
  def show?
    false
  end
end
