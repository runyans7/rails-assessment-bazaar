require "pry"
class Project < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }
  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'
  has_many :tasks

  has_many :project_collaborations
  has_many :collaborators, through: :project_collaborations, source: :user

  after_save :add_user_as_admin
  after_save :set_collaborator_role_to_user

  def is_collaborator
    collaborators.map { |user| user.email }.join(', ')
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

  private

  def add_user_as_admin
    if owner && !collaborators.include?(owner)
      ProjectCollaboration.create(project_id: self.id, user_id: owner.id, role: 0)
    end
  end

  def set_collaborator_role_to_user
    self.project_collaborations.where(role: nil).each do |x|
      x.role = 'user'
      x.save
    end
  end
end
