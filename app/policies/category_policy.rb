class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def index
      true
    end    
    def update
      true
    end
    def destroy
      true
    end
    def create
      true
    end
    def resolve
      s cope.all
    end
  end

end
