require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:incomplete_task)
    @completed_task = tasks(:completed_task)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { complete: @task.complete, content: @task.content } }
    end
    assert_redirected_to tasks_url
  end

  test "should mark a task as complete" do
    post mark_as_complete_task_url(@task.id)
    assert_redirected_to tasks_url
    @task.reload
    assert(@task.complete, true)
  end

  # test "should mark a task as incomplete" do
  #   post mark_as_incomplete_task_url(@task.id)
  #   assert_redirected_to tasks_url
  #   @task.reload
  #   assert(@task.complete, false)
  # end


  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { complete: @task.complete, content: @task.content } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
