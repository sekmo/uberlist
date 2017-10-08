class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:destroy, :complete]

  def new
    @task = @project.tasks.build
  end

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to @project, notice: "Task was successfully created."
    else
      render "projects/show"
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = "Task was successfully deleted."
    else
      flash[:error] = "Error in your request."
    end
    redirect_to @project
  end

  def complete
    @task.update!(completed: true)
    redirect_to @project, notice: "Task completed"
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params[:task].permit(:content)
  end
end
