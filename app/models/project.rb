class Project < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }
  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'
  has_many :tasks

  has_many :project_collaborations
  has_many :collaborators, through: :project_collaborations, source: :user

  def is_collaborator
    collaborators.try(:username) 
  end

  def is_collaborator=(new_collaborator)
    self.collaborators << User.find_by(email: new_collaborator)
  end
end
