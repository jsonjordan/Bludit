class UserPolicy < ApplicationPolicy
  def show?
    record == user
  end

  def index?
    is_admin?
  end

  def destroy?
    is_admin?
  end

  private

  def is_admin?
    user.admin?
  end
end
