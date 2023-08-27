class UserPolicy < ApplicationPolicy
  def edit?
    user.admin?
  end

  def new?
    edit?
  end

  def update?
    edit?
  end

  def deactivate?
    edit?
  end

  def delete?
    edit?
  end
end
