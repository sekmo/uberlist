class TasksController < ApplicationController
  before_action :set_task, only: [:destroy, :complete, :uncomplete]
  before_action :set_project
  after_action :discard_flash_if_xhr, only: [:destroy, :create]

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      flash[:success] = "Task was successfully created."
      respond_to do |format|
        format.html { redirect_to @project }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "projects/show" }
        format.js
      end
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = "Task was successfully deleted."
    end
    respond_to do |format|
      format.html { redirect_to @task.project }
      format.js
    end
  end

  def complete
    @task.update!(completed: true)
    respond_to do |format|
      format.html { redirect_to @task.project }
      format.js
    end
  end

  def uncomplete
    @task.update!(completed: false)
    respond_to do |format|
      format.html { redirect_to @task.project }
      format.js
    end
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
    check_project_owner @project
    rescue ActiveRecord::RecordNotFound
      redirect_to_root_with_error
  end

  def task_params
    params[:task].permit(:content)
  end
end
