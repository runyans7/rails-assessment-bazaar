require 'pry'
class ProjectPolicy < ApplicationPolicy
  def show?
    if is_nil?
      false
    else
      user.project_role(record).admin? || user.project_role(record).user?
    end
  end

  private

  def is_nil?
    return true if user.project_role(record) == nil
  end
end
