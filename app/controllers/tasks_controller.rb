require 'pry'
class TasksController < ApplicationController
  
  def create
    @project = Project.find(params[:project_id])
    @task= @project.tasks.build(task_params)

    if @task.save
      flash[:notice] = "New task created."
      redirect_to project_path(@project)
    else
      render 'projects/show'
    end
  end

  private
  
  def task_params
    params.require(:task).permit(:title, :date_due)
  end

end