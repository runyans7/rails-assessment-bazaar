require 'pry'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  has_many :projects
  has_many :project_collaborations
  has_many :collaborations, through: :project_collaborations, source: :project

  def project_role(project)
    project_collaborations.where("user_id = ? AND project_id = ?", self.id, project.id).first
  end
end
