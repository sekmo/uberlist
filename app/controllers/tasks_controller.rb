class TasksController < ApplicationController
  before_action :set_project

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to @project, notice: "Task was successfully created."
    else
      flash.now[:alert] = "Error in the creation of the task."
      redirect_to @project
    end
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Task was successfully deleted."
    else
      flash[:error] = "Error in your request."
    end
    redirect_to @project
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params[:task].permit(:content)
  end
end
