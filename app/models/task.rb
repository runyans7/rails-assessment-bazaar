class Task < ActiveRecord::Base

  validates_presence_of :title

  belongs_to :project
  belongs_to :user

  def overdue?
    if date_due
      date_due < Date.today
    else
      false
    end
  end
end
