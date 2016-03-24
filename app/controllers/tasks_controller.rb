require 'pry'
class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @task= @project.tasks.build(task_params)

    if @task.save
      respond_to do |format|
        format.html { redirect_to project_path(@project), notice: 'Task created successfully' }
        format.js {}
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :date_due)
  end

end
