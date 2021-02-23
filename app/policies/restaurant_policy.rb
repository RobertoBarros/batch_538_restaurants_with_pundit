class RestaurantPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      # scope: Restaurant
      if user.admin?
        scope.all
      else
        scope.first(2)
      end
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    # record: Restaurant
    # user: current_user
    record.user == user || user.admin?
  end

  def destroy?
    user.admin?
  end

end
