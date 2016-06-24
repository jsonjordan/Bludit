class ModeratorPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    is_admin?
  end

  def index?
    is_admin?
  end

  def destroy?
    is_admin?
  end

  private

  def is_admin?
    unless user.nil?
      user.admin?
    end
  end
end
