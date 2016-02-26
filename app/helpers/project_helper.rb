module ProjectHelper
  def display_recent_activity(item)
    if item.class == Task
      return "A new task was created: #{item.title}, Due date: #{item.date_due ? item.date_due : 'No due date'}"
    else
      return "A new collaborator was added: #{item.email}"
    end
  end

  def format_overdue_tasks(task)
    task.overdue? ? "overdue-item" : "normal"
  end

end
