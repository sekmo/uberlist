module ApplicationHelper
  def error_messages_for(object)
    render(partial: "shared/error_messages", locals: {object: object})
  end

  def flash_message(type, message)
    render(partial: "shared/flash_message", locals: {type: type, message: message})
  end
end
