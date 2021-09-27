class OrderPolicy < ApplicationPolicy
  def index?
    record.user == user
  end

  def show?
    record.user == user
  end

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
