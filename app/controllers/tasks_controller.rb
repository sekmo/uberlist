class TasksController < ApplicationController
  before_action :set_task, only: [:destroy, :complete, :uncomplete]
  before_action :set_project

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
    redirect_to @task.project
  end

  def complete
    @task.update!(completed: true)
    redirect_to @task.project
  end

  def uncomplete
    @task.update!(completed: false)
    redirect_to @task.project
  end

  private

  def set_task
    @task = Task.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to_root_with_error
  end

  def set_project
    if @task
      @project = @task.project
    else
      @project = Project.find(params[:project_id])
    end
    project_owner? @project
    rescue ActiveRecord::RecordNotFound
      redirect_to_root_with_error
  end

  def task_params
    params[:task].permit(:content)
  end
end
