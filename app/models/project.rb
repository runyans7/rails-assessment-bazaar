class Project < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }
  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'
  has_many :tasks

  has_many :project_collaborations
  has_many :collaborators, through: :project_collaborations, source: :user
end
