module TasksHelper
  def mark_as_complete_link(args)
    task = args[:task]
    if args[:completed]
      link_to "Mark as incomplete", uncomplete_project_task_path(task.project, task.id), method: :patch
    else
      link_to "Mark as complete", complete_project_task_path(task.project, task.id), method: :patch
    end
  end
end
