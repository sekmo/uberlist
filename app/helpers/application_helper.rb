module ApplicationHelper
  def status_tag(boolean, options = {})
    options[:true_text] ||= ""
    options[:false_text] ||= ""
    if boolean
      content_tag(:span, options[:true_text], class: "status true")
    else
      content_tag(:span, options[:false_text], class: "status false")
    end
  end

  def mark_complete_button(complete, task, redirect_to_project = {})
    if complete
      link_to("mark as incomplete", mark_as_incomplete_task_path(task), method: :post)
    else
      link_to("mark as complete", mark_as_complete_task_path(task), method: :post)
    end
  end
end
