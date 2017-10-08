module TasksHelper
  def mark_as_complete_link(args)
    task = args[:task]
    if args[:completed]
      link_to "Mark as incomplete", uncomplete_task_path(task.id), method: :patch
    else
      link_to "Mark as complete", complete_task_path(task.id), method: :patch
    end
  end
end
