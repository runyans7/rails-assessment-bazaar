require "pry"
class Project < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }
  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'
  has_many :tasks

  has_many :project_collaborations
  has_many :collaborators, through: :project_collaborations, source: :user

  def is_collaborator
    #collaborators.try(:email)
  end

  def is_collaborator=(new_collaborators)
    self.collaborators = new_collaborators.split(', ').map { |email| User.find_by(email: email) }
  end

  def recent_tasks
    tasks.where(["updated_at > ?", 7.days.ago])
  end

  def recent_collaborators
    recent_additions = project_collaborations.where(["created_at > ?", 7.days.ago])
    recent_additions.map(&:user)
  end

  def recent_activity
    activity = recent_tasks + recent_collaborators
    activity.sort! { |a, b| a.created_at <=> b.created_at }.reverse!
  end
end
