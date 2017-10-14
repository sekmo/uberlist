module TasksHelper
  def mark_as_complete_link(args)
    task = args[:task]
    if args[:completed]
      button_to "Mark as incomplete", uncomplete_task_path(task.id), method: :patch, remote: true
    else
      button_to "Mark as complete", complete_task_path(task.id), method: :patch, remote: true
    end
  end
end
