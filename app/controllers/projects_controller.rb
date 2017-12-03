class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :find_user_projects, only: [:index, :show, :new, :edit]

  def index
  end

  def show
    @task = @project.tasks.build
  end

  def new
    @project = current_user.projects.build
  end

  def edit
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully renamed."
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Project was successfully deleted."
  end

  private

  def set_project
    @project = Project.find(params[:id])
    check_project_owner @project
    rescue ActiveRecord::RecordNotFound
      redirect_to_root_with_error
  end

  def find_user_projects
    @projects = Project.find_by_user(current_user)
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
