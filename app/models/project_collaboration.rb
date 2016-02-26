class ProjectCollaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  enum role: [:admin, :user]
end
