class TasksController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks

    respond_to do |format|
      format.json { render json: @tasks }
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    # binding.pry
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @task }
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)

    if @task.save
      render 'create.js', layout: false
    end
  end

private

  def task_params
    params.require(:task).permit(:title, :date_due)
  end
end
