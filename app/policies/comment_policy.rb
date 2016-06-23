class CommentPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    is_user?
  end

  def update?
    is_user?
  end

  def destroy?
    is_user?
  end

  private

  def is_user?
    record.user == user
  end
end
