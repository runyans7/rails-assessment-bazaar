class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.collaborations
    authorize @projects
  end

  def show
    @project = Project.find(params[:id])
    @task = Task.new
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = current_user.projects.build(project_params)
    authorize @project

    if @project.save
      flash[:notice] = "New project created."
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    authorize @project
  end

  def update
    @project = Project.find(params[:id])
    authorize @project

    if @project.update(project_params)
      flash[:notice] = "Project updated successfully."
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :is_collaborator)
  end
end
