class ProjectPolicy < ApplicationPolicy
  def show?
    if user.project_role(record) == nil
      false
    else
      user.project_role(record).admin? || user.project_role(record).user?
    end
  end
end
