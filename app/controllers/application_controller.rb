class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def check_project_owner(project)
    if project.user != current_user
      redirect_to_root_with_error
    end
  end

  def redirect_to_root_with_error
    flash[:error] = "Error in your request"
    redirect_to root_url
  end

  def discard_flash_if_xhr
    flash.discard if request.xhr?
  end
end
